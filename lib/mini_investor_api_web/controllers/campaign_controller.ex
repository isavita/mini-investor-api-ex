defmodule MiniInvestorApiWeb.CampaignController do
  use MiniInvestorApiWeb, :controller

  alias MiniInvestorApi.Investments

  @default_page 1
  @default_page_size 12

  def index(conn, params) do
    paginated_campaigns = Investments.paginate_campaigns(page(params), page_size(params))

    render(conn, "index.json", paginated_campaigns: paginated_campaigns)
  end

  defp page(params), do: params["page"] || @default_page
  defp page_size(params), do: params["page_size"] || @default_page_size
end
