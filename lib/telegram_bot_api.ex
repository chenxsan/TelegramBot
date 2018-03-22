defmodule TelegramBot.API do
  @moduledoc false
  use HTTPoison.Base

  defp token, do: Application.get_env(:telegram_bot, :token)

  defp proxy do
    cond do
      Application.get_env(:telegram_bot, :proxy) -> Application.get_env(:telegram_bot, :proxy)
      System.get_env("http_proxy") -> System.get_env("http_proxy")
      System.get_env("HTTP_PROXY") -> System.get_env("HTTP_PROXY")
      System.get_env("https_proxy") -> System.get_env("https_proxy")
      System.get_env("HTTPS_PROXY") -> System.get_env("HTTPS_PROXY")
      true -> nil
    end
  end

  @spec process_url(String.t()) :: String.t()
  def process_url(method_name) do
    "https://api.telegram.org/bot" <> token() <> method_name
  end

  def process_request_options(options) do
    if proxy() do
      Keyword.merge(options, proxy: proxy())
    else
      options
    end
  end

  def process_request_body(body) do
    Poison.encode!(body)
  end

  def process_response_body(body) do
    Poison.decode!(body)
  end

  defp handle_response(response) do
    case response do
      {:ok,
       %HTTPoison.Response{
         body: %{
           "ok" => true,
           "result" => result
         }
       }} ->
        {:ok, result}

      {:ok,
       %HTTPoison.Response{
         body: %{
           "ok" => false,
           "description" => reason
         }
       }} ->
        {:error, reason}

      {:error,
       %HTTPoison.Error{
         reason: reason
       }} ->
        {:error, reason}
    end
  end

  def http(action) do
    post(action, %{}, [{"Content-Type", "application/json"}], [])
    |> handle_response
  end

  def http(action, data) do
    post(action, data, [{"Content-Type", "application/json"}], [])
    |> handle_response
  end
end
