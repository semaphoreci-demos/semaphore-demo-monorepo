package main

import (
	"fmt"
	"sort"
	"time"
)

type Charge struct {
	UserID     string    `json:"user_id"`
	Amount     int       `json:"amount"`
	InsertedAt time.Time `json:"inserted_at"`
}

var charges = []Charge{}

func AddCharge(userID string, amount int) {
	charges = append(charges, Charge{
		UserID:     userID,
		Amount:     amount,
		InsertedAt: time.Now(),
	})
}

func FindLastCharge(userID string) (*Charge, error) {
	res := []Charge{}

	for i := range charges {
		if charges[i].UserID == userID {
			res = append(res, charges[i])
		}
	}

	sort.SliceStable(res, func(i, j int) bool {
		return res[i].InsertedAt.After(res[i].InsertedAt)
	})

	if len(res) == 0 {
		return nil, fmt.Errorf("no charges found at all")
	}

	return &res[0], nil
}
