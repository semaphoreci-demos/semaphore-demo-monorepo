defmodule Ui do
  @moduledoc """
  Main router for the UI component.
  """

  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    users = Ui.Users.fetch_all()
    page = Ui.UserListView.render(users)

    conn |> put_resp_content_type("text/html") |> send_resp(200, page)
  end

  get "/billing/:user_id" do
    user = Ui.Users.fetch(user_id)
    billing_info = Ui.Billing.get_info(user_id)

    page = Ui.BillingInfoView.render(user, billing_info)

    conn |> put_resp_content_type("text/html") |> send_resp(200, page)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
