defmodule Ui.BillingInfoView do
  @moduledoc """
  HTML view for the billing information.
  """

  def render(user, billing_info) do
    """
    <html>
      <body>
        <h1>Billing Info for #{user.name}</h1>

        <table>
          <tr>
            <td>Last Charge</td>
            <td>#{billing_info.last_charge}</td>
          </tr>

          <tr>
            <td>Discount</td>
            <td>#{billing_info.discount}</td>
          </tr>
        </table>

        <a href="/">Back</a>
      </body>
    </html>
    """
  end
end
