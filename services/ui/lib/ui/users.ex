defmodule Ui.Users do
  @users [
    %{id: "1", name: "Peter"},
    %{id: "2", name: "John"},
    %{id: "3", name: "Simon"}
  ]

  def fetch(user_id) do
    @users |> Enum.find(fn u -> u.id == user_id end)
  end

  def fetch_all do
    @users
  end
end
