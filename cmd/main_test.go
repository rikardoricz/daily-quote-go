package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestFetchQuote(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		quotes := []Quote{{Content: "Test quote", Author: "Test author"}}
		if err := json.NewEncoder(w).Encode(quotes); err != nil {
			t.Fatal(err)
		}
	}))
	defer server.Close()

	// Test actual function
	quote, err := fetchQuote()
	if err != nil {
		t.Skip("API unavailable")
	}
	if quote.Content == "" {
		t.Error("Quote content is empty")
	}
}

func TestPageData(t *testing.T) {
	data := PageData{
		Quote:   Quote{Content: "test", Author: "author"},
		Version: "1.0.0",
		HasNew:  true,
		Error:   "test error",
	}

	if data.Quote.Content != "test" {
		t.Error("Expected quote content")
	}
	if data.Version != "1.0.0" {
		t.Error("Expected version")
	}
	if !data.HasNew {
		t.Error("Expected HasNew to be true")
	}
	if data.Error != "test error" {
		t.Error("Expected error message")
	}
}
