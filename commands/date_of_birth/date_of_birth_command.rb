require_relative '../command'
require_relative '../../model/user'

class DateOfBirthCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:DATE_OF_BIRTH], bot
  end

  def logic(message)
    User.find(chat_id: message.chat.id).update(action: CommandList::COMMANDS[:ADD_DATE_OF_BIRTH])
    send_message text: 'Введите свою дату рождения dd/mm/yyyy'
  end
end
