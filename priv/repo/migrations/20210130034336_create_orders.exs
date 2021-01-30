defmodule Stonkinator.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :type, :string
      add :status, :string

      timestamps()
    end

  end
end
