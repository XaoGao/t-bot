require_relative '../command'
require_relative '../../model/user'

class DateOfBirthCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:DATE_OF_BIRTH], bot
  end

  def logic(message)
    user = User.find(chat_id: message.chat.id)
    user.update(action: 'add_date_of_birth')
    send_message text: 'Введите свой адрес в формате dd/mm/yyyy'
  end
end
