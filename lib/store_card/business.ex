defmodule StoreCard.Business do

  import Ecto.Query, warn: false
  alias StoreCard.Repo

  alias StoreCard.Business.{Project, Card, Payment}

  # RELATED TO PROJECT

  def list_projects() do
    Project
    |> Repo.all
  end

  def get_project!(id), do: Repo.get!(Project, id)

  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  def delete_card(%Project{} = card) do
    Repo.delete(card)
  end

  def change_card(%Project{} = card, attrs \\ %{}) do
    Project.changeset(card, attrs)
  end

end
  # RELATED TO CARD

  def list_cards() do
    Project
    |> Repo.all
  end

  def get_card!(id), do: Repo.get!(Project, id)

  def create_card(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  def update_card(%Project{} = card, attrs) do
    card
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  def delete_card(%Project{} = card) do
    Repo.delete(card)
  end

  def change_card(%Project{} = card, attrs \\ %{}) do
    Project.changeset(card, attrs)
  end

  # RELATED TO PAYMENT

  def list_payments() do
    Project
    |> Repo.all
  end

  def get_payment!(id), do: Repo.get!(Project, id)

  def create_payment(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  def update_payment(%Project{} = card, attrs) do
    payment
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  def delete_payment(%Project{} = card) do
    Repo.delete(payment)
  end

  def change_payment(%Project{} = card, attrs \\ %{}) do
    Project.changeset(payment, attrs)
  end

end
