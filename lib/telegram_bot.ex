defmodule TelegramBot do
  import TelegramBot.API, only: [http: 1, http: 2]
  @doc """
  A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a User object.
  """

  @typep telegram_response :: {:ok, map} | {:error, String.t}

  @spec getMe() :: telegram_response
  def getMe do
    http("/getMe")
  end

  @typep sendMessageOption :: [parse_mode: String.t, disable_web_page_preview: boolean, disable_notification: boolean, reply_to_message_id: integer]
  
  @spec sendMessage(String.t | integer, String.t, sendMessageOption) :: telegram_response
  def sendMessage(chat_id, text, options \\ []) do
    body = options ++ [chat_id: chat_id, text: text]
    |> Enum.into(%{})
    http("/sendMessage", body)
  end

end