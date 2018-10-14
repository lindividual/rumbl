defmodule Rumbl.Repo.Migrations.AddConstrainToUser do
  use Ecto.Migration

  def change do
      alter table("users") do
        add :username, :string, unique: true
      end

      create unique_index(:users, [:username])
  end
end
