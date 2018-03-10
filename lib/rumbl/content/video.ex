defmodule Rumbl.Content.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Content.Video


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    # field :user_id, :id
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Content.Category

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs \\ :empty) do
    video
    |> cast(attrs, [:url, :title, :description, :category_id] )
    |> validate_required([:url, :title, :description])
  end
end
