defmodule MqttLiveview.Topic.PubSub do
  alias Phoenix.PubSub

  def subscribe(topic) do
    # todo fix topic name
    PubSub.subscribe(MqttLiveview.PubSub, "mqtt")
  end

  def publish(topic, msg) do
    # todo fix topic name
    PubSub.broadcast(MqttLiveview.PubSub, "mqtt", msg)
  end
end
