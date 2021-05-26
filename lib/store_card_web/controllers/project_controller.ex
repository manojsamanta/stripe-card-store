defmodule StoreCardWeb.ProjectController do
  use StoreCardWeb, :controller

  alias StoreCard.Business
  alias StoreCard.Business.Project
  alias StoreCardWeb.Authorizer

  action_fallback StoreCardWeb.FallbackController

  def index(conn, _params) do
    projects = Business.list_projects()
    render(conn, "index.html", projects: projects)
  end

  def new(conn, _params) do
    with :ok <- Authorizer.authorize(:admin, %Project{}, conn.assigns.current_user) do
      changeset = Business.change_project(%Project{})
      render(conn, "new.html", changeset: changeset)
    end
  end

  def create(conn, %{"project" => project_params}) do
    with :ok <- Authorizer.authorize(:admin, %Project{}, conn.assigns.current_user) do
      case Business.create_project(project_params) do
        {:ok, project} ->
          conn
          |> put_flash(:info, "Project created successfully.")
          |> redirect(to: Routes.project_path(conn, :show, project))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    with project = Business.get_project!(id),   
      :ok <- Authorizer.authorize(:show, project, conn.assigns.current_user) do
        render(conn, "show.html", project: project)
    end
  end

  def edit(conn, %{"id" => id}) do
    with project = Business.get_project!(id),   
      :ok <- Authorizer.authorize(:admin, project, conn.assigns.current_user) do
         changeset = Business.change_project(project)
         render(conn, "edit.html", project: project, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    with project = Business.get_project!(id),   
      :ok <- Authorizer.authorize(:admin, project, conn.assigns.current_user) do

      case Business.update_project(project, project_params) do
        {:ok, project} ->
          conn
          |> put_flash(:info, "Project updated successfully.")
          |> redirect(to: Routes.project_path(conn, :show, project))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", project: project, changeset: changeset)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    with project = Business.get_project!(id),   
      :ok <- Authorizer.authorize(:admin, project, conn.assigns.current_user) do
         {:ok, _project} = Business.delete_project(project)

         conn
         |> put_flash(:info, "Project deleted successfully.")
         |> redirect(to: Routes.project_path(conn, :index))
    end
  end
end
