defmodule StoreCard.Business.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :stripe_id, :string

  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:stripe_id])
    |> validate_required([:stripe_id])
  end
end
