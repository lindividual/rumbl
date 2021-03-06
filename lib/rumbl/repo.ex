defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """
  # def all(Rumbl.User) do
  #   [%Rumbl.User{id: "1",name: "josej j", username: "josevalim", password: "elixir"},
  #   %Rumbl.User{id: "2",name: "gloria g", username: "gloriamya", password: "gloria5"}]
  # end
  # def all(_module), do: []

  # def get(module, id) do
  #   Enum.find all(module), fn map -> map.id == id end
  # end

  # def get_by(module, params) do
  #   Enum.find all(module),fn map ->
  #     Enum.all?(params, fn{key, val} -> Map.get(map, key) == val end)
  #   end
  # end
  use Ecto.Repo, otp_app: :rumbl

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
