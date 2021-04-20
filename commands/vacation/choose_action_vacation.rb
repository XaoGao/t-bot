require_relative '../command'

class ChooseActionVacationCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:CHOOSE_ACTION_VACATION], bot
  end

  def logic(message)
    user = User.find_by_chat_id(message)
    user.remove_action
    case message.text
    when CommandList::ACTIONS[:SHOW_VACATION]
      send_message text: user.message_all_vacations
    when CommandList::COMMANDS[:ADD_VACATION]
      action user: user, command: CommandList::COMMANDS[:ADD_VACATION],
              message: "Введите ваш отпуск в формате: 'dd/mm/yyyy : dd/mm/yyyy'"
    when CommandList::COMMANDS[:REMOVE_VACATION]
      remove_vacation user
    end
  end

  private

  def remove_vacation(user)
    if user.vacations.empty?
      send_message text: 'Нет отпусков'
    else
      send_message text: user.message_all_vacations
      action user: user, command: CommandList::COMMANDS[:REMOVE_VACATION],
              message: 'Укажите номер отпуска, который хотите удалить'
    end
  end

  def action(user:, command:, message:)
    send_message text: message
    user.update(action: command)
  end
end
