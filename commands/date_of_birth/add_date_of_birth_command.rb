require_relative '../command'
require_relative '../../model/user'
require 'date'

class AddDateOfBirthCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:ADD_DATE_OF_BIRTH], bot
  end

  def logic(message)
    user = User.find(chat_id: message.chat.id)
    user.update(action: nil)
    begin
      date_of_birth = Date.parse(message.text)
      user.update(date_of_birth: date_of_birth)
      send_message text: "#{user.full_name}, ваше день рождения запомнили! Оно #{user.date_of_birth.strftime("%F")}"
    rescue Exception => e
      send_message text: "#{user.full_name}, вы указали не верный формат"
    end
  end
end
