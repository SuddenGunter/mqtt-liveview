defmodule MqttLiveviewWeb.TopicSelectorLive do
  require Logger
  alias MqttLiveview.Topic.TopicListener
  use MqttLiveviewWeb, :live_view

  @impl true
  @spec mount(nil | maybe_improper_list() | map(), any(), Phoenix.LiveView.Socket.t()) ::
          {:ok, any()}

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       form: to_form(params),
       already_subscribed: false
     )}
  end

  @impl true
  def handle_event("subscribe", params, socket) do
    topic = params["topic"]
    {:noreply, push_navigate(socket, to: ~p"/topic/#{topic}")}
  end
end
