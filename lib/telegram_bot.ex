defmodule TelegramBot do
  @moduledoc """
  A simple Telegram Bot API wrapper for elixir.
  """

  import TelegramBot.API, only: [http: 1, http: 2]

  @doc """
  A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a User object.
  """

  @type telegram_response :: {:ok, map} | {:error, {atom, String.t()}}

  @spec getMe() :: telegram_response
  def getMe do
    http("/getMe")
  end

  @typedoc """
  Value could either be `HTML` or `Markdown`.
  """
  @type parse_mode :: String.t()
  @type sendMessageOption :: [
          parse_mode: parse_mode,
          disable_web_page_preview: boolean,
          disable_notification: boolean,
          reply_to_message_id: integer
        ]

  @spec sendMessage(String.t() | integer, String.t(), sendMessageOption) :: telegram_response
  def sendMessage(chat_id, text, options \\ []) do
    body =
      (options ++ [chat_id: chat_id, text: text])
      |> Enum.into(%{})

    http("/sendMessage", body)
  end

  @doc """
  Get basic info about a file and prepare it for downloading
  """
  @spec getFile(String.t()) :: telegram_response
  def getFile(file_id) do
    http("/getFile", %{file_id: file_id})
  end
end
