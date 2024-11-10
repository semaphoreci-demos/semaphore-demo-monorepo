defmodule Ui.UserListView do
  @moduledoc """
  HTML view for the user list.
  """

  def render(users) do
    """
    <html>
      <body>
        <h1>Users</h1>

        #{render_list(users)}
      </body>
    </html>
    """
  end

  def render_list(users) when users == [] do
    "<p>No users registered in the system</p>"
  end

  def render_list(users) do
    "<table>#{Enum.map_join(users, "\n", &render_user/1)}</table>"
  end

  def render_user(user) do
    """
    <tr>
      <td>#{user.name}</td>
      <td><a href='/billing/#{user.id}'>View Billing</a></td>
    </tr>
    """
  end
end