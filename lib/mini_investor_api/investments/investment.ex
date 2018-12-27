defmodule MiniInvestorApi.Investments.Investment do
  use Ecto.Schema

  import Ecto.Changeset

  alias MiniInvestorApi.Investments.Campaign
  alias __MODULE__

  schema "investments" do
    field :amount_pennies, :integer

    belongs_to :campaign, Campaign

    timestamps()
  end

  @doc false
  def changeset(%Investment{} = investment, attrs) do
    investment
    |> cast(attrs, [:amount_pennies, :campaign_id])
    |> validate_required([:amount_pennies, :campaign_id])
  end
end
