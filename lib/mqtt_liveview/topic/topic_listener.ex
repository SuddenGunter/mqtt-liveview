defmodule MqttLiveview.Topic.TopicListener do
  def get(topic) do
    if topic == "test" do
      {:ok, "test"}
    else
      {:error, :not_implemented}
    end
  end

  def ensure_subscribed(topic) do
    case get(topic) do
      {:ok, _} -> {:ok, "subscribed"}
      {:error, _} -> {:error, :not_implemented}
    end
  end
end
