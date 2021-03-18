package main

type Discount struct {
	UserID   string `json:"user_id"`
	Discount int    `json:"discount"`
}

var discounts = []Discount{}

func FindDiscount(userID string) int {
	for i := range discounts {
		if discounts[i].UserID == userID {
			return discounts[i].Discount
		}
	}

	return 0
}
