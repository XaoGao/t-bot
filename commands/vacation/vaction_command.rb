require_relative '../command'

class VacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:VACATION], bot
  end

  def logic(message)
    User.find(chat_id: message.chat.id).update(action: CommandList::COMMANDS[:CHOOSE_ACTION_VACATION])
    send_message text: 'Что именно вы хотите сделать?', reply_markup: keyboard
  end

  private

  def keyboard
    reply_keyboard [%w(show_vacation add_vacation remove_vacation)]
  end
end
