defmodule DoWeb.Router do
  use DoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DoWeb do
    pipe_through :api

    get "/", IndexController, :index
  end
end
