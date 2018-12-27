# Install apline linux with elixir
FROM elixir:1.7.4-alpine

# Create app directory and make it build directory
WORKDIR /app

# Copy all packages from current directory to WORKDIR
COPY . .

# Install hex package manager
RUN mix local.hex --force

# Install all dependecies
RUN mix deps.get

# Compile the project
RUN mix compile
