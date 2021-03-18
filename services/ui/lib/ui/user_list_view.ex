defmodule Ui.UserListView do
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

  def render_list(users) do
    "<table>#{Enum.map(users, &render_user/1) |> Enum.join("\n")}</table>"
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
