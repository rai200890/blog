import Config

import System, only: [get_env: 1, get_env: 2, fetch_env!: 1]
import String, only: [to_integer: 1]

config :blog, Blog.Repo,
  database: System.get_env("DATABASE_NAME", "liveview_database"),
  username: System.get_env("DATABASE_USERNAME", "postgres"),
  password: System.get_env("DATABASE_PASSWORD", "postgres"),
  hostname: System.get_env("DATABASE_HOST", "localhost")

config :blog,
  ecto_repos: [Blog.Repo]

config :livebook, LivebookWeb.Endpoint,
  pubsub_server: Livebook.PubSub,
  live_view: [signing_salt: "livebook"],
  url: [host: "localhost"],
  http: [port: "PORT" |> System.get_env("8080") |> String.to_integer()],
  secret_key_base: "a1lsAbpZf8abWI0/MVM0ApXJUjpiG/rf2TT4NeSLkkIkgOkqo6BRilXNp7JuO1CI",
  code_reloader: false

config :livebook,
  root_path: ".",
  default_runtime: {Livebook.Runtime.MixStandalone, ["."]},
  authentication_mode: :password,
  token_authentication: false,
  password: System.get_env("LIVEBOOK_PASSWORD", "livebook"),
  cookie: :livebook_cookie

config :phoenix, :json_library, Jason
