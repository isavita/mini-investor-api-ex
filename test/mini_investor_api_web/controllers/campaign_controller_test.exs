defmodule MiniInvestorApiWeb.CampaignControllerTest do
  use MiniInvestorApiWeb.ConnCase

  alias MiniInvestorApi.Investments

  @campaign_attrs %{
    "name" => "Company 1",
    "target_amount_pennies" => 100_000,
    "raised_amount_pennies" => 10_000,
    "multiplier_amount_pennies" => 100
  }

  describe "index/2" do
    setup do
      {:ok, campaign1: fixture_campaign(), campaign2: fixture_campaign(%{"name" => "Company 2"})}
    end

    test "responds with all campaign", %{conn: conn, campaign1: campaign1, campaign2: campaign2} do
      response =
        conn
        |> get(Routes.campaign_path(conn, :index))
        |> json_response(200)

      data = response["data"]
      meta = response["meta"]
      campaign1_id = campaign1.id
      campaign2_id = campaign2.id

      assert [%{"id" => ^campaign1_id}, %{"id" => ^campaign2_id}] = data["campaigns"]
      assert meta["page"] == 1
      assert meta["pageSize"] == 12
      assert meta["totalPages"] == 1
      assert meta["totalEntries"] == 2
    end

    test "responds with one campaign when `page_size=1` and `page=2` added to the request", %{
      conn: conn,
      campaign2: campaign2
    } do
      query = Routes.campaign_path(conn, :index) <> "?page=2&pageSize=1"

      response =
        conn
        |> get(query)
        |> json_response(200)

      data = response["data"]
      meta = response["meta"]
      campaign2_id = campaign2.id

      assert [%{"id" => ^campaign2_id}] = data["campaigns"]
      assert meta["page"] == 2
      assert meta["pageSize"] == 1
      assert meta["totalPages"] == 2
      assert meta["totalEntries"] == 2
    end
  end

  describe "show/2" do
    setup do
      {:ok, campaign: fixture_campaign()}
    end

    test "responds with the campaign", %{conn: conn, campaign: campaign} do
      response =
        conn
        |> get(Routes.campaign_path(conn, :show, campaign.id))
        |> json_response(200)

      assert response["id"] == campaign.id
      assert response["name"] == campaign.name
      assert response["targetAmount"] == campaign.target_amount_pennies
      assert response["raisedAmount"] == campaign.raised_amount_pennies
      assert response["multiplierAmount"] == campaign.multiplier_amount_pennies
      assert response["raisedPercentage"] == 10
      assert response["sector"] == campaign.sector
      assert response["countryName"] == campaign.country_name
    end
  end

  defp fixture_campaign(attrs \\ %{}) do
    @campaign_attrs
    |> Map.merge(attrs)
    |> Investments.create_campaign()
    |> (&elem(&1, 1)).()
  end
end
