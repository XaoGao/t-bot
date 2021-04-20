require 'sequel'
require_relative './vacation'

class User < Sequel::Model
  one_to_many :vacations

  def full_name
    "#{first_name} #{last_name}"
  end

  def message_all_vacations
    if vacations.empty?
      "#{full_name}, У вас пока нет отпуска =("
    else
      "Ваш отпуск: \n#{show_intervals}"
    end
  end

  def show_intervals
    result = ''
    vacations.each_with_index do |v, i|
      result += "#{i + 1}) #{v.interval} \n"
    end
    result
  end

  def remove_action
    update(action: nil)
  end

  dataset_module do
    def find_by_chat_id(message)
      find(chat_id: message.chat.id).first
    end
  end
end
