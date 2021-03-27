defmodule Ranaco.Repo do
  use Ecto.Repo,
    otp_app: :ranaco,
    adapter: Ecto.Adapters.Postgres
end
