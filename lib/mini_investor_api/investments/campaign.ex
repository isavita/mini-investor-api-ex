defmodule MiniInvestorApi.Investments.Campaign do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "campaigns" do
    field :name, :string
    field :target_amount_pennies, :integer
    field :multiplier_amount_pennies, :integer
    field :raised_amount_pennies, :integer
    field :image_url, :string
    field :sector, :string
    field :country_name, :string
    field :lock_version, :integer, default: 1

    timestamps()
  end

  @doc false
  def changeset(%Campaign{} = campaign, attrs) do
    campaign
    |> cast(attrs, [
      :name,
      :target_amount_pennies,
      :multiplier_amount_pennies,
      :raised_amount_pennies,
      :image_url,
      :sector,
      :country_name
    ])
    |> validate_required([:name, :target_amount_pennies])
    |> optimistic_lock(:lock_version)
  end
end
