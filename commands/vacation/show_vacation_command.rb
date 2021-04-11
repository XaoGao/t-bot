require_relative '../command'

class ShowVacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:SHOW_VACATION], bot
  end

  def logic(message)
    user = User.find(chat_id: message.chat.id)
    send_message text: user.show_vacations
  end
end
