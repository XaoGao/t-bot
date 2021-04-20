require_relative '../command'
require_relative '../../model/vacation'
class AddVacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:ADD_VACATION], bot
  end

  def logic(message)
    return if match? message.text

    user = User.find(chat_id: message.chat.id)
    user.update(action: nil)
    begin
      array = message.text.delete(' ').split(':').compact
      from = Date.parse(array[0])
      by = Date.parse(array[1])
      user.add_vacation(Vacation.create(from: from, by: by))
      send_message text: 'Новый отпуск успешно добавлен'
    rescue Exception => e
      send_message text: "#{user.full_name}, вы указали не верный формат"
    end
  end
end
