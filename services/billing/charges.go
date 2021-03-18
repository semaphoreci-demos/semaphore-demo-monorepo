package main

import (
	"fmt"
	"sort"
)

type Charge struct {
	UserID     string `json:"user_id"`
	Amount     int    `json:"amount"`
	InsertedAt int    `json:"inserted_at"`
}

var charges = []Charge{}

func FindLastCharge(userID string) (*Charge, error) {
	res := []Charge{}

	for i := range charges {
		if charges[i].UserID == userID {
			res = append(res, charges[i])
		}
	}

	sort.SliceStable(res, func(i, j int) bool {
		return res[i].InsertedAt > res[i].InsertedAt
	})

	if len(res) == 0 {
		return nil, fmt.Errorf("no charges found")
	}

	return &res[0], nil
}
