defmodule DevopsApiWeb.Plugs.Context do
  @behaviour Plug

  import Plug.Conn

  def init(_opts) do
  end

  def call(conn, _params) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- DevopsApi.Guardian.decode_and_verify(token),
         {:ok, user} <- DevopsApi.Guardian.resource_from_claims(claims) do
      %{current_user: user}
    else
      _error ->
        %{}
    end
  end
end
