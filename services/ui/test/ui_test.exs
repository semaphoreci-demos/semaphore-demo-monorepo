defmodule UiTest do
  use ExUnit.Case
  use Plug.Test

  import Mock

  @users [
    %{id: "1", name: "Peter"},
    %{id: "2", name: "John"},
    %{id: "3", name: "Simon"}
  ]

  @billing_info %{last_charge: "$690.00", discount: "10%"}

  test "viewing the list of users when the root page is visited" do
    with_mocks([{Ui.Users, [], [fetch_all: fn -> @users end]}]) do
      conn = conn(:get, "/") |> Ui.call(%{})

      assert conn.resp_body |> String.contains?("Peter")
      assert conn.resp_body |> String.contains?("John")
      assert conn.resp_body |> String.contains?("Simon")
    end
  end

  test "viewing billing info" do
    with_mocks([
      {Ui.Users, [], [fetch: fn _ -> hd(@users) end]},
      {Ui.Billing, [], [get_info: fn _ -> @billing_info end]}
    ]) do
      conn = conn(:get, "/billing/1") |> Ui.call(%{})

      assert conn.resp_body |> String.contains?("$690.00")
      assert conn.resp_body |> String.contains?("10%")
    end
  end
end
