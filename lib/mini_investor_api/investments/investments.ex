defmodule MiniInvestorApi.Investments do
  @moduledoc """
  The Investments context which have the basic functionality for managing Campaigns and Investments.
  """

  import Ecto.Query, warn: false

  alias MiniInvestorApi.Repo
  alias MiniInvestorApi.Investments.Campaign

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
end
