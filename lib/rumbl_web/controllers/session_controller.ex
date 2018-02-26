defmodule RumblWeb.SessionController do
    use RumblWeb, :controller

    def new(conn, _) do
        render conn, "new.html"
    end

    def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
        case Rumbl.Auth.login_by_username_and_pass(conn, user, pass, repo: repo) do
            {:ok, conn} ->
                conn
                |> put_flash(:info, "welcome back!")
                |> redirect(to: page_path(conn, :index))
            {:error, _reason, conn} ->
                conn
                |> put_flash(:error, "login failure")
                |> render("new.html")
        end
    end
end