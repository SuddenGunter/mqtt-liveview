defmodule MqttLiveviewWeb.TopicLive do
  alias MqttLiveview.Topic.TopicListener
  use MqttLiveviewWeb, :live_view

  @impl true
  @spec mount(nil | maybe_improper_list() | map(), any(), Phoenix.LiveView.Socket.t()) ::
          {:ok, any()}

  def mount(params, _session, socket) do
    {:ok, socket}
  end
end
