defmodule MqttLiveview.Topic.Listener do
  require Logger
  alias MqttLiveview.Topic.PubSub

  @behaviour ExMQTT.PublishHandler

  @impl true
  def handle_publish(%{payload: payload, topic: topic}, _extra) do
    PubSub.publish(topic, payload)
    :ok
  end
end
