import Config

# ---------------------------#
# Guardian
# ---------------------------#
config :fuschia, FuschiaWeb.Auth.Pipeline,
  module: FuschiaWeb.Auth.Guardian,
  error_handler: FuschiaWeb.Auth.ErrorHandler

# ---------------------------#
# Sentry
# ---------------------------#
config :sentry,
  dsn: System.get_env("SENTRY_DNS"),
  environment_name: config_env(),
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{
    env: "production"
  },
  included_environments: [System.get_env("SENTRY_ENV")]

# ---------------------------#
# Oban
# ---------------------------#
config :fuschia, Oban,
  repo: Fuschia.Repo,
  queues: [mailers: 5]

config :fuschia, :jobs, start: System.get_env("START_OBAN_JOBS", "true")

# ---------------------------#
# Timex
# ---------------------------#
config :timex, timezone: System.get_env("TIMEZONE", "America/Sao_Paulo")
