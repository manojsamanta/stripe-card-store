defmodule StoreCard.Business.Purchase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "purchases" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(purchase, attrs) do
    purchase
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
