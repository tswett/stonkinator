defmodule Stonkinator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Stonkinator.Repo,
      # Start the Telemetry supervisor
      StonkinatorWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Stonkinator.PubSub},
      # Start the Endpoint (http/https)
      StonkinatorWeb.Endpoint,
      # Start a worker by calling: Stonkinator.Worker.start_link(arg)
      # {Stonkinator.Worker, arg}
      {Stonkinator.OrderProcessor, name: Stonkinator.OrderProcessor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stonkinator.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StonkinatorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
