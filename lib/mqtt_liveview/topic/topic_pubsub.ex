defmodule MqttLiveview.Topic.PubSub do
  alias Phoenix.PubSub

  def subscribe(topic) do
    PubSub.subscribe(MqttLiveview.PubSub, "mqtt/#{topic}")
  end

  def publish(topic, msg) do
    PubSub.broadcast(MqttLiveview.PubSub, "mqtt/#{topic}", msg)
  end
end
