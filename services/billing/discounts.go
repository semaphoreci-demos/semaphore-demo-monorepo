package main

type Discount struct {
	UserID   string `json:"user_id"`
	Discount int    `json:"discount"`
}

var discounts = []Discount{}

func AddDiscount(userID string, discount int) {
	discounts = append(discounts, Discount{
		UserID:   userID,
		Discount: discount,
	})
}

func FindDiscount(userID string) int {
	for i := range discounts {
		if discounts[i].UserID == userID {
			return discounts[i].Discount
		}
	}

	return 0
}
