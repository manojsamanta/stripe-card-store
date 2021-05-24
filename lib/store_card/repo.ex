defmodule StoreCard.Repo do
  use Ecto.Repo,
    otp_app: :store_card,
    adapter: Ecto.Adapters.Postgres
end
