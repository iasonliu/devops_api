defmodule DevopsApiWeb.Router do
  use DevopsApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, DevopsApiWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GrapiQL, DevopsApiWeb.Schema)
    end
  end
end
