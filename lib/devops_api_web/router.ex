defmodule DevopsApiWeb.Router do
  use DevopsApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", DevopsApiWeb do
    pipe_through(:api)
  end
end
