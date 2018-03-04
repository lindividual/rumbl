defmodule Rumbl.Content.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Content.Category

  schema "categories" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
