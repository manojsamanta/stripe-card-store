defmodule StoreCardWeb.PageController do
  use StoreCardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
