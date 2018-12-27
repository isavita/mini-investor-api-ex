defmodule MiniInvestorApiWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(MiniInvestorApiWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MiniInvestorApiWeb.ErrorView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, message}) when is_binary(message) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MiniInvestorApiWeb.ErrorView)
    |> render("error.json", message: message)
  end
end
