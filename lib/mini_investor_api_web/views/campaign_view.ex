defmodule MiniInvestorApiWeb.CampaignView do
  use MiniInvestorApiWeb, :view

  def render("index.json", %{paginated_campaigns: paginated_campaigns}) do
    %{
      data: %{
        campaigns: render_many(paginated_campaigns.entries, MiniInvestorApiWeb.CampaignView, "campaign.json"),
        page: paginated_campaigns.page_number,
        page_size: paginated_campaigns.page_size,
        total_pages: paginated_campaigns.total_pages,
        total_entries: paginated_campaigns.total_entries
      }
    }
  end

  def render("campaign.json", %{campaign: campaign}) do
    %{
      id: campaign.id,
      name: campaign.name,
      target_amount_pennies: campaign.target_amount_pennies,
      multiplier_amount_pennies: campaign.multiplier_amount_pennies,
      amount_pennies: campaign.amount_pennies,
      image_url: campaign.image_url,
      sector: campaign.sector,
      country_name: campaign.country_name
    }
  end
end
