# FoodBookPoland API

Rails 7 API-only backend for FoodBookPoland. This currently ports over just the dashboard
authentication system from the [foodmap-demo](https://github.com/JakubDashDev/foodmap-demo)
prototype — the domain models (locations, content creators, reviews) are intentionally left out
for now and will be redesigned from scratch for this project.

## What's here

- **Refresh-token rotation with reuse detection**, JWT access tokens, and `httponly`/`secure`/
  `same_site: :strict` cookies. See [`app/services/auth/`](app/services/auth) and
  [`app/models/refresh_token.rb`](app/models/refresh_token.rb).
- `AdminUser` model (`has_secure_password`) and the `Dashboard::AuthenticationsController` /
  `Dashboard::BaseController` pair that issues and verifies sessions.
- Full RSpec coverage for the rotation logic and the auth request flow, in
  [`spec/services/auth/`](spec/services/auth), [`spec/models/refresh_token_spec.rb`](spec/models/refresh_token_spec.rb),
  and [`spec/requests/dashboard/authentications_spec.rb`](spec/requests/dashboard/authentications_spec.rb).

## Running it locally

```bash
# Rails needs one secret to boot — generate it and drop it in .env
cp .env.example .env
# fill JWT_SECRET_KEY with:
#   openssl rand -hex 64

# from the repo root
docker compose -f docker-compose-dev.yml up --build
```

The API comes up on http://localhost:3200. The database starts empty; `db/seeds.rb` creates an
`admin@example.com` / `password123` `AdminUser` in development.

## Testing

```bash
bundle exec rspec
```
