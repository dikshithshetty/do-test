use Mix.Config

config :do, DoWeb.Endpoint,
  url: [host: "example.com", port: 80]

config :logger, level: :info

config :do, :settings,
  version: :crypto.strong_rand_bytes(12) |> Base.url_encode64

config :do, DoWeb.Endpoint, server: true
