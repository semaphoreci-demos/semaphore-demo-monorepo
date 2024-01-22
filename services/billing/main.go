package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"strconv"

	handlers "github.com/gorilla/handlers"
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

func ChargeHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	var c BillingInfo

	err := json.NewDecoder(r.Body).Decode(&c)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	charge, _ := strconv.Atoi(c.LastCharge)
	discount, _ := strconv.Atoi(c.Discount)

	AddCharge(vars["user_id"], charge)
	AddDiscount(vars["user_id"], discount)

	res, err := json.Marshal(c)

	w.Header().Set("Content-Type", "application/json")
	w.Write(res)
}

var Router *mux.Router

func Initialize() {
	Router = mux.NewRouter()

	Router.HandleFunc("/billing/{user_id}/info", BillingInfoHandler)

	Router.HandleFunc("/billing/{user_id}/charge", ChargeHandler).Methods("POST")

	http.Handle("/", Router)
}

func main() {
	fmt.Println("Starting the billing service")
	Initialize()

	loggedRouter := handlers.LoggingHandler(os.Stdout, Router)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8000"
	}

	srv := &http.Server{
		Handler: loggedRouter,
		Addr:    ":" + port,
	}

	srv.ListenAndServe()

}
