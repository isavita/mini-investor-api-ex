defmodule MiniInvestorApiWeb.InvestmentController do
  use MiniInvestorApiWeb, :controller

  alias MiniInvestorApi.Investments

  action_fallback MiniInvestorApiWeb.FallbackController

  def create(conn, %{"campaignId" => campaign_id} = params) do
    campaign = Investments.get_campaign!(campaign_id)

    with {:ok, investment} <- Investments.create_investment_and_update_campaign(campaign, investment_attrs(params)),
         do: render(conn, "investment.json", investment: investment)
  end

  defp investment_attrs(%{"amount" => amount_pennies}) do
    %{"amount_pennies" => amount_pennies}
  end
end
