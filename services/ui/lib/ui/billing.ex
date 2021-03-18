defmodule Ui.Billing do
  @moduledoc """
  Access to the Billing service.
  """

  def get_info(user_id) do
    %{last_charge: "$670.00", discount: "10%"}
  end
end
