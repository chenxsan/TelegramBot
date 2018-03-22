defmodule TelegramBot.Mixfile do
  use Mix.Project

  def project do
    [
      app: :telegram_bot,
      version: "0.1.1",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      source_url: "https://github.com/chenxsan/TelegramBot",
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:jason, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    "Telegram Bot API wrapper for elixir"
  end

  defp package() do
    [
      name: "telegram_bot",
      source_url: "https://github.com/chenxsan/TelegramBot",
      licenses: ["MIT"],
      maintainers: ["Sam Chen"],
      links: %{"GitHub" => "https://github.com/chenxsan/TelegramBot"}
    ]
  end
end
