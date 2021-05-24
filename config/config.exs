# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :store_card,
  ecto_repos: [StoreCard.Repo]

# Configures the endpoint
config :store_card, StoreCardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1ziwUSNzZ265vd8DQtTmZMlZmIC3JCPB0GE8PvF4m2SUicZkTKG8DpA9mj/rt1H4",
  render_errors: [view: StoreCardWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: StoreCard.PubSub,
  live_view: [signing_salt: "ubW1cmpO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
