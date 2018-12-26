defmodule MiniInvestorApiWeb.CampaignView do
  use MiniInvestorApiWeb, :view

  def render("index.json", %{paginated_campaigns: paginated_campaigns}) do
    %{
      data: %{
        campaigns: render_many(paginated_campaigns.entries, MiniInvestorApiWeb.CampaignView, "campaign.json"),
        page: paginated_campaigns.page_number,
        pageSize: paginated_campaigns.page_size,
        totalPages: paginated_campaigns.total_pages,
        totalEntries: paginated_campaigns.total_entries
      }
    }
  end

  def render("campaign.json", %{campaign: campaign}) do
    %{
      id: campaign.id,
      name: campaign.name,
      targetAmount: campaign.target_amount_pennies,
      multiplierAmount: campaign.multiplier_amount_pennies,
      raisedAmount: campaign.raised_amount_pennies,
      raisedPercentage: raised_percentage(campaign.target_amount_pennies, campaign.raised_amount_pennies),
      imageUrl: campaign.image_url,
      sector: campaign.sector,
      countryName: campaign.country_name
    }
  end

  defp raised_percentage(target_amount, raised_amount) do
    Float.round(raised_amount / target_amount * 100, 2)
  end
end
