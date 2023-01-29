defmodule ElixirInAction.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirInActionWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirInAction.PubSub},
      # Start the Endpoint (http/https)
      ElixirInActionWeb.Endpoint
      # Start a worker by calling: ElixirInAction.Worker.start_link(arg)
      # {ElixirInAction.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirInAction.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirInActionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
