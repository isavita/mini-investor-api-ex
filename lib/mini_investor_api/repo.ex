defmodule MiniInvestorApi.Repo do
  use Ecto.Repo,
    otp_app: :mini_investor_api,
    adapter: Ecto.Adapters.Postgres
end
