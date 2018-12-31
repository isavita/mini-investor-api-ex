defmodule MiniInvestorApiWeb.CampaignController do
  use MiniInvestorApiWeb, :controller

  alias MiniInvestorApi.Investments

  @default_page 1
  @default_page_size 12

  def index(conn, params) do
    paginated_campaigns = Investments.paginate_campaigns(page(params), page_size(params))

    render(conn, "index.json", paginated_campaigns: paginated_campaigns)
  end

  def show(conn, %{"id" => id}) do
    with campaign <- Investments.get_campaign!(id),
         do: render(conn, "show.json", campaign: campaign)
  end

  defp page(params), do: params["page"] || @default_page
  defp page_size(params), do: params["pageSize"] || @default_page_size
end
