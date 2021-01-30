# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :stonkinator,
  ecto_repos: [Stonkinator.Repo]

# Configures the endpoint
config :stonkinator, StonkinatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tyyL1SdzHTw7WskeU03TTnfFsmhU9fSY37aAO/XVII8kp3XMwpZ1qW9WEjm93+pt",
  render_errors: [view: StonkinatorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Stonkinator.PubSub,
  live_view: [signing_salt: "rzG8Bot7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
