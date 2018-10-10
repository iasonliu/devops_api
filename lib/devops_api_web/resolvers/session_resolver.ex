defmodule DevopsApiWeb.Resolvers.SessionResolver do
  alias DevopsApi.{Accounts, Guardian}

  def login_user(_, %{input: input}, _) do
    # check if the user in our database
    # is user is registred we wanna return a token
    # and we want to return the user
    with {:ok, user} <- Accounts.Session.authenticate(input),
         {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
