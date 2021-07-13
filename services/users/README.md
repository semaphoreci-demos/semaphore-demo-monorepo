# Users Service

This service implements in-memory simple user registration.

## Endpoints

GET `/users`
    Returns the user list in JSON format
    Example response: `{ "id": 0, "name": "Rodrigo Amarante" }`

POST `/users`
    Example body: `{ "name": "Rodrigo Amarante" }`

## Building

``` bash
bundle install
```

## Running

``` bash
bundle exec ruby app.rb
```

## Testing

``` bash
bundle exec ruby test.rb
```

## License

Copyright (c) 2021 Rendered Text

Distributed under the MIT License. See the file LICENSE.

[semaphore]: https://semaphoreci.com
[create-project]: https://docs.semaphoreci.com/article/63-your-first-project
[change-in]: https://docs.semaphoreci.com/reference/conditions-reference/#change_in
[monorepo]: https://docs.semaphoreci.com/essentials/building-monorepo-projects/
