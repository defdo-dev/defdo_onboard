defmodule Defdo.Onboard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Defdo.Onboard.Repo,
      # Start the Telemetry supervisor
      Defdo.OnboardWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Defdo.Onboard.PubSub},
      # Start the Endpoint (http/https)
      Defdo.OnboardWeb.Endpoint
      # Start a worker by calling: Defdo.Onboard.Worker.start_link(arg)
      # {Defdo.Onboard.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Defdo.Onboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Defdo.OnboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
