package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	mux "github.com/gorilla/mux"
)

type BillingInfo struct {
	LastCharge string `json:"last_charge"`
	Discount   string `json:"discount"`
}

func BillingInfoHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)

	lastCharge, err := FindLastCharge(vars["user_id"])
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	discount := FindDiscount(vars["user_id"])

	info := BillingInfo{
		LastCharge: fmt.Sprintf("$%d.00", lastCharge.Amount),
		Discount:   fmt.Sprintf("%d%%", discount),
	}

	res, err := json.Marshal(&info)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(res)
}

var Router *mux.Router

func Initialize() {
	Router = mux.NewRouter()

	Router.HandleFunc("/billing/{user_id}/info", BillingInfoHandler)
}

func main() {
	Initialize()

	http.Handle("/", Router)
}
