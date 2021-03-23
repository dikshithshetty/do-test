defmodule DoWeb.IndexController do
  use DoWeb, :controller

  def index(conn, _params) do
    version =
      Application.get_env(:do, :settings)
      |> Keyword.fetch!(:version)

    send_resp(conn, 200, "Version new #{version}")
  end
end
