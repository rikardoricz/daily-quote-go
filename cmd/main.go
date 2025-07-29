package main

import (
	"encoding/json"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"time"

	"github.com/rikardoricz/daily-quote-go/version"
)

type Quote struct {
	Content string `json:"content"`
	Author  string `json:"author"`
}

type PageData struct {
	Quote   Quote
	Error   string
	HasNew  bool
	Version string
}

var (
	lastQuote   Quote
	lastFetched time.Time
	cacheTTL    = 1 * time.Minute
)

func main() {
	tmpl, err := template.ParseFiles("web/template/index.html")
	if err != nil {
		log.Fatal("Error parsing template:", err)
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		data := PageData{
			Version: version.VERSION,
		}

		if r.URL.Query().Get("new") == "true" {
			data.HasNew = true
		}

		quote, err := fetchQuote()
		if err != nil {
			data.Error = "Failed to fetch quote: " + err.Error()
		} else {
			data.Quote = quote
		}

		err = tmpl.Execute(w, data)
		if err != nil {
			http.Error(w, "Error rendering template", http.StatusInternalServerError)
		}
	})

	fmt.Println("Server starting on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func fetchQuote() (Quote, error) {
	if time.Since(lastFetched) < cacheTTL && lastQuote.Content != "" {
		return lastQuote, nil
	}

	client := &http.Client{
		Timeout: 10 * time.Second,
	}

	resp, err := client.Get("https://api.realinspire.live/v1/quotes/random")
	if err != nil {
		return Quote{}, err
	}
	defer func() {
		_ = resp.Body.Close()
	}()

	if resp.StatusCode != http.StatusOK {
		return Quote{}, fmt.Errorf("API returned status code: %d", resp.StatusCode)
	}

	var quotes []Quote
	err = json.NewDecoder(resp.Body).Decode(&quotes)
	if err != nil {
		return Quote{}, err
	}

	if len(quotes) == 0 {
		return Quote{}, fmt.Errorf("no quotes returned from API")
	}

	lastQuote = quotes[0]
	lastFetched = time.Now()
	return lastQuote, nil
}
