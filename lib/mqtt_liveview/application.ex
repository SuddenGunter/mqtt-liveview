defmodule MqttLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MqttLiveviewWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:mqtt_liveview, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MqttLiveview.PubSub},
      # Start a worker by calling: MqttLiveview.Worker.start_link(arg)
      # {MqttLiveview.Worker, arg},
      # Start to serve requests, typically the last entry
      MqttLiveviewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MqttLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MqttLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
