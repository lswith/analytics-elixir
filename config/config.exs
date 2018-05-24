# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :segment,
  api: Segment.Server,
  http_adapter: Segment.HTTP.HTTPPoison

if Mix.env() === :test, do: import_config "test.exs"
