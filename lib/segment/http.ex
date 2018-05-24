defmodule Segment.HTTP do
  @moduledoc "Adapter behaviour for HTTP calls"
  @callback post(String.t(), String.t()) :: map()
  @callback post!(String.t(), String.t(), keyword()) :: map()
end
