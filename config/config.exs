# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mini_investor_api,
  ecto_repos: [MiniInvestorApi.Repo]

# Configures the endpoint
config :mini_investor_api, MiniInvestorApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v+prjPxIBTGXBv8w2Ir6bLRmg9cZ0pT7aRndHG6kJosEeuSdDl8qmpdbpJKsbilr",
  render_errors: [view: MiniInvestorApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MiniInvestorApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
