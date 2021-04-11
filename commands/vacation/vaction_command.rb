require_relative '../command'

class VacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:VACATION], bot
  end

  def logic(message)
    # user = User.find(chat_id: message.chat.id)
    # user.update(action: 'choose_vacation')
    answer = reply_keyboard [%w(show_vacation add_vacation remove_vacation)]
    send_message text: 'Что именно вы хотите сделать?', reply_markup: answer
  end
end
