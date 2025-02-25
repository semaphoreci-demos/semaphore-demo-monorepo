package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

	assert "github.com/stretchr/testify/assert"
)

func TestMain(m *testing.M) {
	Initialize()

	AddCharge("1", 100)
	AddDiscount("1", 12)

	code := m.Run()
	os.Exit(code)
}

func TestGettingBillingInfo(t *testing.T) {
	req, err := http.NewRequest("GET", "/billing/1/info", nil)
	assert.Nil(t, err)

	response := executeRequest(req)

	assert.Equal(t, http.StatusOK, response.Code)

	info := &BillingInfo{}
	err = json.Unmarshal(response.Body.Bytes(), info)
	assert.Nil(t, err)

	assert.Equal(t, info.LastCharge, "$100.00")
	assert.Equal(t, info.Discount, "12%")
}

func executeRequest(req *http.Request) *httptest.ResponseRecorder {
	rr := httptest.NewRecorder()
	Router.ServeHTTP(rr, req)

	return rr
}

