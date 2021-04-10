module BotAction
  def send_message(text:, chat_id: message.chat.id)
    bot.api.send_message(chat_id: chat_id, text: text)
  end
end
