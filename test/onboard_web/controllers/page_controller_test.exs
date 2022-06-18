defmodule Defdo.OnboardWeb.PageControllerTest do
  use Defdo.OnboardWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "defdo"
  end
end
