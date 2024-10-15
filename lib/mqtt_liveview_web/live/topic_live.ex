defmodule MqttLiveviewWeb.TopicLive do
  alias MqttLiveview.Topic.TopicListener
  use MqttLiveviewWeb, :live_view
  require Logger
  @impl true
  @spec mount(nil | maybe_improper_list() | map(), any(), Phoenix.LiveView.Socket.t()) ::
          {:ok, any()}

  def mount(params, _session, socket) do
    if connected?(socket) do
      MqttLiveview.Topic.PubSub.subscribe(params["topic_name"])
    end

    {:ok,
     socket
     |> stream_configure(:messages,
       dom_id: fn msg ->
         # todo: better algorithm, maybe parse payload etc
         :crypto.hash(:md5, msg)
         |> Base.encode16(case: :lower)
       end
     )
     |> stream(:messages, [])
     |> assign(topic: params["topic_name"])}
  end

  @impl true
  def handle_info(msg_payload, socket) do
    {:noreply, stream_insert(socket, :messages, msg_payload, at: 0, limit: 20)}
  end
end
