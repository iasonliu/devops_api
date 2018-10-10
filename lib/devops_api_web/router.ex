defmodule DevopsApiWeb.Router do
  use DevopsApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(DevopsApiWeb.Plugs.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, schema: DevopsApiWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: DevopsApiWeb.Schema)
    end
  end
end
