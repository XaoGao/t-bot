require_relative '../command'

class RemoveVacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:REMOVE_VACATION], bot
  end

  def logic(message)
    return if match? message.text

    user = User.find_by_chat_id(message)
    user.remove_action
    begin
      input = Integer(message.text)
      raise ArgumentError unless input.between?(1, user.vacations.count + 1)

      user.vacations.each_with_index do |v, i|
        v.delete if (i + 1) == input
      end
      send_message text: 'Отпуск успешно удален'
    rescue Exception => e
      send_message text: "#{user.full_name}, вы указали не верный формат"
    end
  end
end
