# Install apline linux with elixir
FROM elixir:1.7.4-alpine

# Install hex package manager
RUN mix local.hex --force

# Install phoenix
RUN mix archive.install hex phx_new 1.4.0 --force

# Create app directory and make it build directory
WORKDIR /app
