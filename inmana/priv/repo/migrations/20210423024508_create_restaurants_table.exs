defmodule Inmana.Repo.Migrations.CreateRestaurantsTable do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
     add :email, :string
     add :name, :string

     timestamps()
    end

    create unique_index(:restaurants, [:email]) #crear ID unico
  end
end
