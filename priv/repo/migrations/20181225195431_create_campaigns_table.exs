defmodule MiniInvestorApi.Repo.Migrations.CreateCampaignsTable do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :name, :string, null: false
      add :target_amount_pennies, :integer, null: false
      add :multiplier_amount_pennies, :integer, null: false, default: 1
      add :amount_pennies, :integer
      add :image_url, :string
      add :sector, :string
      add :country_name, :string
      add :lock_version, :integer, default: 1

      timestamps()
    end

    create unique_index(:campaigns, [:name])
  end
end
