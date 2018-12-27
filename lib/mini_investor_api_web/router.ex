defmodule MiniInvestorApiWeb.Router do
  use MiniInvestorApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MiniInvestorApiWeb do
    pipe_through :api

    resources "/campaigns", CampaignController, only: [:index]
    resources "/investments", InvestmentController, only: [:create]
  end
end
