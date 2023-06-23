defmodule HrSystem.Repo do
  use Ecto.Repo,
    otp_app: :hr_system,
    adapter: Ecto.Adapters.Postgres
end
