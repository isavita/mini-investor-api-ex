defmodule MiniInvestorApi.Repo.Migrations.CreateInvestmentsTable do
  use Ecto.Migration

  def change do
    create table(:investments) do
      add :amount_pennies, :integer, null: false
      add :campaign_id, references(:campaigns), null: false

      timestamps()
    end

    create index(:investments, [:campaign_id])
  end
end
