# UI Service

This service adds a UI layer on top of the Billing and Users services.

## Building

``` bash
mix local.hex
mix local.rebar
mix deps.get
mix deps.compile
```

## Running

``` bash
mix run --no-halt
```

Default listenting port is 4000. Override it by setting `PORT`.

## Testing

``` bash
mix test
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ui` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ui, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ui](https://hexdocs.pm/ui).

## License

Copyright (c) 2021 Rendered Text

Distributed under the MIT License. See the file LICENSE.

[semaphore]: https://semaphoreci.com
[create-project]: https://docs.semaphoreci.com/article/63-your-first-project
[change-in]: https://docs.semaphoreci.com/reference/conditions-reference/#change_in
[monorepo]: https://docs.semaphoreci.com/essentials/building-monorepo-projects/
