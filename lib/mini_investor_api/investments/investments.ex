defmodule MiniInvestorApi.Investments do
  @moduledoc """
  The Investments context which have the basic functionality for managing Campaigns and Investments.
  """

  import Ecto.Query, warn: false

  alias Ecto.Multi
  alias MiniInvestorApi.Repo
  alias MiniInvestorApi.Investments.Campaign
  alias MiniInvestorApi.Investments.Investment

  @doc """
  Creates a campaign.

  ## Examples

      iex> create_campaign(%{"name" => "Trip to Mars", "target_amount_pennies" => 1})
      {:ok, %Campaign{}}

      iex> create_campaign(%{"name" => nil})
      {:error, %Ecto.Changeset{}}

  """
  def create_campaign(attrs) do
    %Campaign{}
    |> Campaign.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of campaigns.

  ## Examples

      iex> list_campaigns()
      [%Campaign{}, ...]

  """
  def list_campaigns() do
    Repo.all(Campaign)
  end

  @doc """
  Returns `map` with list of `page_size` number of campaigns from given page `page`,
  total number of campaings, and total number of pages.
  """
  def paginate_campaigns(page, page_size) do
    Repo.paginate(Campaign, page: page, page_size: page_size)
  end

  @doc """
  Creates an investment and updates the campaign amount.
  """
  def create_investment_and_update_campaign(campaign, attrs) do
    Multi.new()
    |> Multi.insert(:investment, create_investment(campaign, attrs))
    |> Multi.update(:update_campaign, fn %{investment: investment} ->
      Campaign.changeset(campaign, %{
        "raised_amount_pennies" => campaign.raised_amount_pennies + investment.amount_pennies
      })
    end)
    |> Repo.transaction()
    |> case do
      {:ok, %{investment: investment, update_campaign: _}} -> {:ok, investment}
      {:error, _operation, reason, _changes} -> {:error, reason}
    end
  end

  defp create_investment(campaign, attrs) do
    Investment.changeset(%Investment{}, Map.put(attrs, "campaign_id", campaign.id))
  end
end
