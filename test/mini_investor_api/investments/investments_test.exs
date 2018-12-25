defmodule MiniInvestorApi.InvestmentsTest do
  use MiniInvestorApi.DataCase

  alias MiniInvestorApi.Repo
  alias MiniInvestorApi.Investments
  alias MiniInvestorApi.Investments.Campaign

  @campaign_valid_attrs %{
    "name" => "Company 1",
    "target_amount_pennies" => 100_000,
    "multiplier_amount_pennies" => 200,
    "amount_pennies" => 1_000,
    "image_url" => "image.jpg",
    "sector" => "Sector 1",
    "country_name" => "Country 1"
  }

  describe "create_campaign/1" do
    test "with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Investments.create_campaign(@campaign_valid_attrs)
      assert campaign.name == @campaign_valid_attrs["name"]
      assert campaign.target_amount_pennies == @campaign_valid_attrs["target_amount_pennies"]
      assert campaign.multiplier_amount_pennies == @campaign_valid_attrs["multiplier_amount_pennies"]
      assert campaign.amount_pennies == @campaign_valid_attrs["amount_pennies"]
      assert campaign.image_url == @campaign_valid_attrs["image_url"]
      assert campaign.sector == @campaign_valid_attrs["sector"]
      assert campaign.country_name == @campaign_valid_attrs["country_name"]
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Investments.create_campaign(%{})
    end
  end

  describe "list_campaigns/0" do
    setup do
      {:ok, campaign: fixture_campaign()}
    end

    test "returns all campaigns", %{campaign: campaign} do
      assert Investments.list_campaigns() == [campaign]
    end
  end

  defp fixture_campaign(attrs \\ @campaign_valid_attrs) do
    %Campaign{}
    |> Campaign.changeset(attrs)
    |> Repo.insert!()
  end
end
