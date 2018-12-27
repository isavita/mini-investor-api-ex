defmodule MiniInvestorApi.InvestmentsTest do
  use MiniInvestorApi.DataCase

  alias MiniInvestorApi.Repo
  alias MiniInvestorApi.Investments
  alias MiniInvestorApi.Investments.Campaign
  alias MiniInvestorApi.Investments.Investment

  @campaign_valid_attrs %{
    "name" => "Company 1",
    "target_amount_pennies" => 100_000,
    "multiplier_amount_pennies" => 200,
    "raised_amount_pennies" => 1_000,
    "image_url" => "image.jpg",
    "sector" => "Sector 1",
    "country_name" => "Country 1"
  }
  @investment_valid_attrs %{"amount_pennies" => 100}

  describe "create_campaign/1" do
    test "with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Investments.create_campaign(@campaign_valid_attrs)
      assert campaign.name == @campaign_valid_attrs["name"]
      assert campaign.target_amount_pennies == @campaign_valid_attrs["target_amount_pennies"]
      assert campaign.multiplier_amount_pennies == @campaign_valid_attrs["multiplier_amount_pennies"]
      assert campaign.raised_amount_pennies == @campaign_valid_attrs["raised_amount_pennies"]
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

  describe "paginate_campaigns/2" do
    setup do
      {:ok, campaign1: fixture_campaign(), campaign2: fixture_campaign(%{"name" => "Company 2"})}
    end

    test "with `page` and `page_size` returns `page_size` number of campaigns", %{
      campaign1: campaign1,
      campaign2: campaign2
    } do
      assert %{entries: campaigns, page_number: 1, page_size: 1, total_entries: 2, total_pages: 2} =
               Investments.paginate_campaigns(1, 1)

      assert campaigns == [campaign1]

      assert %{entries: campaigns, page_number: 2, page_size: 1, total_entries: 2, total_pages: 2} =
               Investments.paginate_campaigns(2, 1)

      assert campaigns == [campaign2]
    end
  end

  describe "create_investment_and_update_campaign/1" do
    setup do
      {:ok, campaign: fixture_campaign()}
    end

    test "with valid data creates an investment and updates campaign's raised amount", %{campaign: campaign} do
      assert {:ok, %Investment{} = investment} =
               Investments.create_investment_and_update_campaign(campaign, @investment_valid_attrs)

      assert investment.campaign_id == campaign.id
      assert investment.amount_pennies == @investment_valid_attrs["amount_pennies"]

      assert get_campaign(campaign.id).raised_amount_pennies ==
               campaign.raised_amount_pennies + investment.amount_pennies
    end

    test "with invalid data returns error changeset", %{campaign: campaign} do
      assert {:error, %Ecto.Changeset{}} = Investments.create_investment_and_update_campaign(campaign, %{})
    end
  end

  defp fixture_campaign(attrs \\ %{}) do
    %Campaign{}
    |> Campaign.changeset(Map.merge(@campaign_valid_attrs, attrs))
    |> Repo.insert!()
  end

  defp get_campaign(id), do: Repo.get!(Campaign, id)
end
