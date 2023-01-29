import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_in_action, ElixirInActionWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ZV8succEZrEclqfqRgmuDkTsb9gKz79gQKnRELu9F5WjMuRgJ9OM9xQi4v15M+kj",
  server: false

# In test we don't send emails.
config :elixir_in_action, ElixirInAction.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
