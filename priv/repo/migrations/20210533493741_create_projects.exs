defmodule StoreCard.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do

    create table(:projects) do
      add :title, :string, null: false
      add :body, :string
      add :is_done, :boolean, default: true, null: false
      add :price, :integer, default: 20, null: false

      add :user_id, references("users",  on_delete: :delete_all), null: false

      timestamps()
    end

  end
end
