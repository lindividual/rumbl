defmodule Rumbl.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :description, :text
      add :user_id, references(:users)
      add :url, :string

      timestamps()
    end

    create index(:videos, [:user_id])
  end
end
