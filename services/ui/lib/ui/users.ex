defmodule Ui.Users do
  @moduledoc """
  Access to the Users service.
  """

  defmodule User do
    defstruct [:name, :id]
  end

  def fetch(user_id) do
    fetch_all() |> Enum.find(fn u -> u.id == user_id end)
  end

  def fetch_all do
    endpoint = Ui.Config.users_endpoint()
    path = "#{endpoint}/users"

    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(path)

    Poison.decode!(body, as: [%User{}])
  end
end
