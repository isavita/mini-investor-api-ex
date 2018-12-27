defmodule MiniInvestorApiWeb.InvestmentView do
  use MiniInvestorApiWeb, :view

  def render("investment.json", %{investment: investment}) do
    %{
      id: investment.id,
      amount: investment.amount_pennies,
      campaignId: investment.campaign_id
    }
  end
end
