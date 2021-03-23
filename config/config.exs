use Mix.Config

config :do, DoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aDjANByl9jBp/+4pFTTtpAhOxUPtGKUyUULMzIsVUMFaekPe3uNTPrQqJhIw2y9N",
  render_errors: [view: DoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Do.PubSub,
  live_view: [signing_salt: "Tq7sLNww"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :do, :settings,
  version: "dev"

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
