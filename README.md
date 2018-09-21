# TelegramBot

A simple [Telegram Bot API](https://core.telegram.org/bots/api#available-methods) wrapper for elixir.

## Installation

Just add `telegram_bot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:telegram_bot, "~> 1.0.1"}
  ]
end
```
Then run `mix deps.get`.

And configure telegram token for `telegram_bot` in `dev.exs` and `prod.exs`:

```elixir
# Configures token for telegram bot
config :telegram_bot,
  token: System.get_env("TELEGRAM_TOKEN")
```

## Methods supported

1. `getMe`
2. `sendMessage`
3. `getFile`

