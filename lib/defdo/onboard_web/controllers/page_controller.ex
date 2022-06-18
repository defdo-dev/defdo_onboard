defmodule Defdo.OnboardWeb.PageController do
  use Defdo.OnboardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
