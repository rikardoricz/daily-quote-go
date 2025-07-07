package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestQuote(t *testing.T) {
	quote := Quote{
		Content: "Test quote content",
		Author:  "Test Author",
	}

	if quote.Content != "Test quote content" {
		t.Errorf("Expected 'Test quote content', got %s", quote.Content)
	}

	if quote.Author != "Test Author" {
		t.Errorf("Expected 'Test Author', got %s", quote.Author)
	}
}

func TestPageData(t *testing.T) {
	quote := Quote{Content: "Hello", Author: "World"}
	data := PageData{
		Quote:  quote,
		Error:  "test error",
		HasNew: true,
	}

	if data.Quote.Content != "Hello" {
		t.Error("Quote content not set correctly")
	}
	if data.Error != "test error" {
		t.Error("Error not set correctly")
	}
	if !data.HasNew {
		t.Error("HasNew should be true")
	}
}

func TestFetchQuoteSuccess(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		quotes := []Quote{{Content: "Mock quote", Author: "Mock Author"}}
		json.NewEncoder(w).Encode(quotes)
	}))
	defer server.Close()

	client := &http.Client{}
	resp, err := client.Get(server.URL)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	var quotes []Quote
	err = json.NewDecoder(resp.Body).Decode(&quotes)
	if err != nil {
		t.Fatal(err)
	}

	if len(quotes) == 0 {
		t.Fatal("No quotes returned")
	}

	quote := quotes[0]
	if quote.Content != "Mock quote" {
		t.Errorf("Expected 'Mock quote', got %s", quote.Content)
	}
	if quote.Author != "Mock Author" {
		t.Errorf("Expected 'Mock Author', got %s", quote.Author)
	}
}

func TestFetchQuoteServerError(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusInternalServerError)
	}))
	defer server.Close()

	client := &http.Client{}
	resp, err := client.Get(server.URL)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	if resp.StatusCode == http.StatusOK {
		t.Error("Expected non-OK status code")
	}
}

func TestFetchQuoteEmptyResponse(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		json.NewEncoder(w).Encode([]Quote{})
	}))
	defer server.Close()

	client := &http.Client{}
	resp, err := client.Get(server.URL)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	var quotes []Quote
	err = json.NewDecoder(resp.Body).Decode(&quotes)
	if err != nil {
		t.Fatal(err)
	}

	if len(quotes) != 0 {
		t.Error("Expected empty quotes array")
	}
}
