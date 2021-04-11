require_relative '../command'

class AddVacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:ADD_VACATION], bot
  end

  def logic(message)
    user = User.find(chat_id: message.chat.id)
    user.update(action: 'add_vacation')
    send_message text: 'Введите свой адрес в формате dd/mm/yyyy'
  end
end
