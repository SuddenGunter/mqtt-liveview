defmodule MqttLiveviewWeb.TopicLive do
  alias MqttLiveview.Topic.TopicListener
  use MqttLiveviewWeb, :live_view

  @impl true
  @spec mount(nil | maybe_improper_list() | map(), any(), Phoenix.LiveView.Socket.t()) ::
          {:ok, any()}

  def mount(params, _session, socket) do
    if connected?(socket) do
      # ExMQTT.subscribe(params["topic_name"], 1)

      # MqttLiveview.Topic.PubSub.subscribe()
    end

    {:ok, socket}
  end
end
