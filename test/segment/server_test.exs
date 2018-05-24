defmodule Segment.ServerTest do
  use ExUnit.Case

  alias Segment.{Context, Track, Server}

  import Mox

  setup :set_mox_global
  setup :verify_on_exit!

  describe "&Segment.Server.send_track/2" do
    test "sends a request to segment" do
      Segment.HTTP.AdapterMock
      |> expect(:post!, fn "track", body, opts ->
        assert body == Poison.encode!(%Track{
          anonymousId: nil,
          context: %Context{
            active: nil,
            app: nil,
            campaign: nil,
            device: nil,
            ip: nil,
            library: %{name: "analytics_elixir", version: "1.1.0"},
            locale: nil,
            location: nil,
            network: nil,
            os: nil,
            page: nil,
            referrer: nil,
            screen: nil,
            timezone: nil,
            traits: nil,
            userAgent: nil
          },
          event: "Test Event",
          integrations: nil,
          method: "track",
          properties: %{},
          timestamp: nil,
          userId: "343434"
        })
        assert opts == [ssl: [versions: [:"tlsv1.2"]]]
      end)
      |> stub(:post, fn _, _ -> :ok end)

      assert :ok = Server.send_track("343434", "Test Event")

      # Forces the test process to wait for the handle_cast call to complete
      GenServer.stop(Process.whereis(Server))
    end
  end
end
