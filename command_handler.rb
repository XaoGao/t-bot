require_relative './helpers/command_list'
require_relative './model/user'
require 'byebug'
class CommandHandler
  def initialize(bot)
    @bot = bot
    @commands_list = CommandList.init_commands(@bot)
  end

  def call(message)
    user = User.find(chat_id: message.chat.id)
    if user.nil?
      user = User.create(chat_id: message.chat.id, first_name: message.from.first_name, last_name: message.from.last_name,
        username: message.from.username)
    end

    command(user.action).call message unless user.action.nil?

    command(message.text).call message if message_is_command? message.text
  end

  private

  def command(command_name)
    @commands_list.find { |com| com.match? command_name }
  end

  def message_is_command?(text)
    CommandList.find_command text
  end
end
