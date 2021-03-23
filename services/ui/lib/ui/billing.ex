defmodule Ui.Billing do
  @moduledoc """
  Access to the Billing service.
  """

  defmodule BillingInfo do
    @moduledoc """
    Information about billing for one user.
    """
    defstruct [:last_charge, :discount]
  end

  def get_info(user_id) do
    endpoint = Ui.Config.billing_endpoint()
    path = "#{endpoint}/billing/#{user_id}/info"

    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(path)

    Poison.decode!(body, as: %BillingInfo{})
  end
end
