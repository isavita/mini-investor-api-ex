defmodule MiniInvestorApiWeb.InvestmentControllerTest do
  use MiniInvestorApiWeb.ConnCase

  alias MiniInvestorApi.Investments

  @investment_params %{"amount" => 100}
  @campaign_attrs %{"name" => "Company 1", "target_amount_pennies" => 100_000, "multiplier_amount_pennies" => 100}

  describe "create/2" do
    setup do
      {:ok, campaign: fixture_campaign()}
    end

    test "responds with a newly created investment", %{conn: conn, campaign: campaign} do
      campaign_id = campaign.id
      params = Map.put(@investment_params, "campaignId", campaign_id)

      response =
        conn
        |> post(Routes.investment_path(conn, :create), params)
        |> json_response(200)

      assert %{"amount" => 100, "campaignId" => ^campaign_id} = response
    end

    test "responds with an error when cannot create investment", %{conn: conn, campaign: campaign} do
      params = %{"amount" => -100, "campaignId" => campaign.id}

      response =
        conn
        |> post(Routes.investment_path(conn, :create), params)
        |> json_response(422)

      assert %{"errors" => %{"detail" => "amount needs to be positive"}} = response
    end
  end

  defp fixture_campaign(attrs \\ %{}) do
    @campaign_attrs
    |> Map.merge(attrs)
    |> Investments.create_campaign()
    |> (&elem(&1, 1)).()
  end
end
