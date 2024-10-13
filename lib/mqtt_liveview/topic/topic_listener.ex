defmodule MqttLiveview.Topic.TopicListener do
  require Logger
  @behaviour ExMQTT.MessageHandler
  @behaviour ExMQTT.PublishHandler

  @impl true
  def handle_message(topic, message, _extra) do
    Logger.warning("MSG")
    :ok
  end

  @impl true
  def handle_publish(message, _extra) do
    Logger.warning("PUB")
    :ok
  end
end
