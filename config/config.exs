# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ranaco, ecto_repos: [Ranaco.Repo], generators: [binary_id: true]

# Configures the endpoint
config :ranaco, RanacoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: RanacoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ranaco.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :ranaco, Ranaco.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :ranaco,
   ecto_repo: Ranaco.Repo,
   router: RanacoWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
