# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MiniInvestorApi.Repo.insert!(%MiniInvestorApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

campaigns_data = [
  %{
    name: "Starling Bank",
    image_url: "https://www.bankingtech.com/files/2017/10/social-image.png",
    target_amount_pennies: 800_000_000,
    multiplier_amount_pennies: 1_250,
    raised_amount_pennies: 200_000_000,
    sector: "Finance",
    country_name: "United Kingdom"
  },
  %{
    name: "Tesla Roadster",
    image_url: "https://cdn.teslarati.com/wp-content/uploads/2017/04/preisert-tesla-roadster-convertible-rendering.jpg",
    target_amount_pennies: 1_000_000_000,
    multiplier_amount_pennies: 5_000,
    raised_amount_pennies: 810_000_000,
    sector: "Automotive Industry",
    country_name: "USA"
  },
  %{
    name: "Uber",
    image_url:
      "https://cached.imagescaler.hbpl.co.uk/resize/scaleWidth/614/cached.offlinehbpl.hbpl.co.uk/news/ORP/uber2-2-2016-20160202092201179.jpg",
    target_amount_pennies: 100_000_000,
    multiplier_amount_pennies: 1_100,
    raised_amount_pennies: 93_999_400,
    sector: "Transportation",
    country_name: "USA"
  },
  %{
    name: "Revolut",
    image_url: "https://moneycheck-9fcd.kxcdn.com/wp-content/uploads/2018/09/revolut-review-1.jpg",
    target_amount_pennies: 80_000_000,
    multiplier_amount_pennies: 100,
    raised_amount_pennies: 96_000_000,
    sector: "Finance",
    country_name: "France"
  },
  %{
    name: "Prada",
    image_url: "https://i.ebayimg.com/images/g/JzwAAOSwzaJX3z59/s-l300.jpg",
    target_amount_pennies: 40_000_000,
    multiplier_amount_pennies: 100_000,
    raised_amount_pennies: 17_000_000,
    sector: "Fashion",
    country_name: "Italy"
  },
  %{
    name: "Ferrari",
    image_url: "https://static.ferrarinetwork.ferrari.com/images/GATEWAY_Home_1280x960_QJKALQhU.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 100_000,
    raised_amount_pennies: 317_000_000,
    sector: "Automotive Industry",
    country_name: "Italy"
  },
  %{
    name: "BMW",
    image_url:
      "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/vdat/submodels/bmw_m8-gran-coupe_bmw-concept-m8-gran-coupe_2018-1532968589970.jpg",
    target_amount_pennies: 500_000_000,
    multiplier_amount_pennies: 500_000,
    raised_amount_pennies: 437_000_000,
    sector: "Automotive Industry",
    country_name: "Germany"
  },
  %{
    name: "Mercedes",
    image_url:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Mercedes-Benz_600_vl_silver_TCE.jpg/1200px-Mercedes-Benz_600_vl_silver_TCE.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 100_000,
    raised_amount_pennies: 317_000_000,
    sector: "Automotive Industry",
    country_name: "Germany"
  },
  %{
    name: "SpaceX",
    image_url: "https://www.nasaspaceflight.com/wp-content/uploads/2018/10/2018-10-22-13_27_15-Window.jpg",
    target_amount_pennies: 40_000_000,
    multiplier_amount_pennies: 100_000,
    raised_amount_pennies: 1_700_000,
    sector: "Space Industry",
    country_name: "USA"
  },
  %{
    name: "Blue Origin",
    image_url: "https://spacenews.com/wp-content/uploads/2017/04/blueorigin-bezos.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 1,
    raised_amount_pennies: 17_000_000,
    sector: "Space Industry",
    country_name: "USA"
  },
  %{
    name: "Rocket Lab",
    image_url:
      "https://www.rocketlabusa.com/assets/Uploads/_resampled/FillWyI3ODAiLCI0NzAiXQ/RocketLab-F3-ItsBusinessTime-Patch.jpg",
    target_amount_pennies: 40_000_000,
    multiplier_amount_pennies: 1_000_000,
    raised_amount_pennies: 57_000_000,
    sector: "Space Industry",
    country_name: "New Zealand"
  },
  %{
    name: "Deliveroo",
    image_url:
      "https://www.arabianbusiness.com/sites/default/files/styles/full_img/public/images/2018/03/15/Deliveroo%E2%80%99s-Anis-Harb.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 100,
    raised_amount_pennies: 270_000_000,
    sector: "Ordering Industry",
    country_name: "United Kingdom"
  },
  %{
    name: "Google",
    image_url: "https://ai.google/static/images/share.png",
    target_amount_pennies: 400_000,
    multiplier_amount_pennies: 100,
    raised_amount_pennies: 170_000,
    sector: "Internet",
    country_name: "USA"
  },
  %{
    name: "Yahoo",
    image_url: "https://i.ytimg.com/vi/5DpspOXs1rM/maxresdefault.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 500,
    raised_amount_pennies: 777_000_000,
    sector: "Internet",
    country_name: "USA"
  },
  %{
    name: "QFood",
    image_url:
      "https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/1/7/6/0/5980671-3-eng-GB/Quorn-invests-150M-to-create-more-than-300-jobs_wrbm_large.jpg",
    target_amount_pennies: 100_000_000,
    multiplier_amount_pennies: 10_000,
    raised_amount_pennies: 110_000_000,
    sector: "Food Industry",
    country_name: "United Kingdom"
  },
  %{
    name: "Tesco",
    image_url: "https://www.personneltoday.com/wp-content/uploads/sites/8/2018/07/tesco.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 100,
    raised_amount_pennies: 221_000_000,
    sector: "Food Industry",
    country_name: "United Kingdom"
  },
  %{
    name: "Nike",
    image_url:
      "http://content.nike.com/content/dam/one-nike/globalAssets/social_media_images/nike_swoosh_logo_black.png",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 100_000,
    raised_amount_pennies: 170_000_000,
    sector: "Footwear",
    country_name: "USA"
  },
  %{
    name: "Adidas",
    image_url: "https://nssdata.s3.amazonaws.com/images/galleries/12347/cover/cover-adidas-nss-magazine_v2.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 1_000,
    raised_amount_pennies: 373_000_000,
    sector: "Footwear",
    country_name: "USA"
  },
  %{
    name: "Shell",
    image_url:
      "https://www.shell.com/investors/_jcr_content/pagePromo/image.img.960.jpeg/1457612146464/shell-service-station.jpeg",
    target_amount_pennies: 40_000_000,
    multiplier_amount_pennies: 10_000,
    raised_amount_pennies: 17_000_000,
    sector: "Oil Industry",
    country_name: "USA"
  },
  %{
    name: "Hollywood",
    image_url: "https://www.history.com/.image/t_share/MTU3ODc5MDg2Njk4OTMxOTM1/hollywood-sign-3.jpg",
    target_amount_pennies: 400_000_000,
    multiplier_amount_pennies: 10_000,
    raised_amount_pennies: 379_000_000,
    sector: "Entertainment Industry",
    country_name: "USA"
  }
]

Enum.each(campaigns_data, &MiniInvestorApi.Investments.create_campaign/1)
