defmodule Stonkinator.Repo do
  use Ecto.Repo,
    otp_app: :stonkinator,
    adapter: Ecto.Adapters.Postgres
end
