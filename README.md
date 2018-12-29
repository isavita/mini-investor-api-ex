# Mini Investor Api

## Setup the project
### Install postgresql

  * [on mac](https://www.codementor.io/engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb)
  * [on ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
  * [on windows](http://www.postgresqltutorial.com/install-postgresql)

### To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

### To start web app

  * Clone the [web app repository](https://github.com/isavita/mini-investor-ui)
  * Follow the README of the repository to setup the project

## Docker setup
  * For initial setup (creates the database and runs the seed) run
  ```shell
  make setup
  ```
  * For rebuild run
  ```shell
  make dev
  `````

  Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.
