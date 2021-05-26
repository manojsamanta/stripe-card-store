# Store Card and Charge Later

This module sets up a site that keeps the credit card of a user and charges it periodically in future according to provided service. As an example, the user can request cabs and get charged after completion of service.

The credit card number is requested, when the user requests for service for the first time.

## Implementation


### phx_gen_auth

The user model is created using the [phx_gen_auth library](https://github.com/aaronrenner/phx_gen_auth).

### Setting up migrations/models




## Common Instructions

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
