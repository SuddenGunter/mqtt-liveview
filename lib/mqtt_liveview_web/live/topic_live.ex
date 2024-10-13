defmodule MqttLiveviewWeb.TopicLive do
  alias MqttLiveview.Topic.TopicListener
  use MqttLiveviewWeb, :live_view
  require Logger
  @impl true
  @spec mount(nil | maybe_improper_list() | map(), any(), Phoenix.LiveView.Socket.t()) ::
          {:ok, any()}

  def mount(params, _session, socket) do
    if connected?(socket) do
      Logger.error("mqtt/#{params["topic_name"]}")
      MqttLiveview.Topic.PubSub.subscribe("mqtt")
    end

    {:ok, assign(socket, msg: nil)}
  end

  @impl true
  def handle_info(msg_payload, socket) do
    Logger.error(msg_payload)
    {:noreply, assign(socket, msg: msg_payload)}
  end
end
