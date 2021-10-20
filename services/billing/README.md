# Billing Service

This service handles charges and discounts for users.

## Endpointss

GET `/billing/USER_ID/info`
    view charges for a given user
    Example response: `{ "last_charge": "$100.00", "discount": "12%" }`

POST `/billing/USER_ID/charge`
    Add a charge and discount to a given user
    Example body: `{ "last_charge": "100", "discount": "12"  }`

## Building

``` bash
go get ./...
go build -v .
```

## Running

``` bash
chmod a+x ./billing
./billing
```

Default listenting port is 9000. Override it by setting `PORT`.

## Testing

``` bash
go test .
```

## License

Copyright (c) 2021 Rendered Text

Distributed under the MIT License. See the file LICENSE.

[semaphore]: https://semaphoreci.com
[create-project]: https://docs.semaphoreci.com/article/63-your-first-project
[change-in]: https://docs.semaphoreci.com/reference/conditions-reference/#change_in
[monorepo]: https://docs.semaphoreci.com/essentials/building-monorepo-projects/


