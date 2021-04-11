require 'telegram/bot'
module BotAction
  def send_message(text:, chat_id: message.chat.id, reply_markup: nil)
    bot.api.send_message(chat_id: chat_id, text: text, reply_markup: reply_markup)
  end

  def reply_keyboard(keyboard)
    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keyboard, one_time_keyboard: true)
  end
end


# case message.text
  # when '/start'
  #   question = 'London is a capital of which country?'
  #   # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
  #   answers =
  #     Telegram::Bot::Types::ReplyKeyboardMarkup
  #     .new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
  #   bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
  # when '/stop'
  #   # See more: https://core.telegram.org/bots/api#replykeyboardremove
  #   kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
  #   bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: kb)
  # end