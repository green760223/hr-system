defmodule HrSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HrSystemWeb.Telemetry,
      # Start the Ecto repository
      HrSystem.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HrSystem.PubSub},
      # Start Finch
      {Finch, name: HrSystem.Finch},
      # Start the Endpoint (http/https)
      HrSystemWeb.Endpoint
      # Start a worker by calling: HrSystem.Worker.start_link(arg)
      # {HrSystem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HrSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HrSystemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
