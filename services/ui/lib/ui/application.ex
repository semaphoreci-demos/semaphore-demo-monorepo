defmodule Ui.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Ui, options: [port: 4001]}
    ]

    opts = [strategy: :one_for_one, name: Ui.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
