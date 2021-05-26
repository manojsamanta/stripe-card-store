defmodule StoreCard.Business.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :body, :string
    field :title, :string
    field :is_done, :boolean, default: true, null: false
    field :price, :integer, default: 20, null: false

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :body, :is_done, :price])
    |> validate_required([:title, :body])
  end
end
