defmodule StoreCardWeb.Authorizer do

  alias StoreCard.Accounts.User
  alias StoreCard.Business.Project
  alias StoreCardWeb.PaymentController

  def authorize(:show, %Project{} = project, %User{}=user) do
    case user.role do
      "admin"  -> :ok
      "customer"  -> :ok
      "guest" -> {:route, project}
    end
  end

  def authorize(:admin, %Project{} = _project, %User{}=user) do
    if user.role== "admin" do
      :ok 
    else
      {:error, :unauthorized}
    end
  end

end
