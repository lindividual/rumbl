defmodule Rumbl.User do
  alias RumblWeb
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :username, :string
    field :password, :string, virtual: true
    has_many :videos, Rumbl.Content.Video

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, ~w(name username), [])
    |> validate_length(:name, min: 6, max: 20)
    |> validate_length(:username, min: 6, max: 20)
    |> unique_constraint(:username)
  end

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 30)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
