defmodule MiniInvestorApiWeb.CampaignControllerTest do
  use MiniInvestorApiWeb.ConnCase

  alias MiniInvestorApi.Repo
  alias MiniInvestorApi.Investments.Campaign

  @campaign_attrs %{"name" => "Company 1", "target_amount_pennies" => 100_000}

  describe "index/2" do
    setup do
      {:ok, campaign1: fixture_campaign(), campaign2: fixture_campaign(%{"name" => "Company 2"})}
    end

    test "responds with all users", %{conn: conn, campaign1: campaign1, campaign2: campaign2} do
      response =
        conn
        |> get(Routes.campaign_path(conn, :index))
        |> json_response(200)

      data = response["data"]
      campaign1_id = campaign1.id
      campaign2_id = campaign2.id

      assert [%{"id" => ^campaign1_id}, %{"id" => ^campaign2_id}] = data["campaigns"]
      assert data["page"] == 1
      assert data["page_size"] == 12
      assert data["total_pages"] == 1
      assert data["total_entries"] == 2
    end

    test "responds with one user when `page_size=1` and `page=2` added to the request", %{conn: conn, campaign2: campaign2} do
      query = Routes.campaign_path(conn, :index) <> "?page=2&page_size=1"

      response =
        conn
        |> get(query)
        |> json_response(200)

      data = response["data"]
      campaign2_id = campaign2.id

      assert [%{"id" => ^campaign2_id}] = data["campaigns"]
      assert data["page"] == 2
      assert data["page_size"] == 1
      assert data["total_pages"] == 2
      assert data["total_entries"] == 2
    end
  end

  defp fixture_campaign(attrs \\ %{}) do
    %Campaign{}
    |> Campaign.changeset(Map.merge(@campaign_attrs, attrs))
    |> Repo.insert!()
  end
end
