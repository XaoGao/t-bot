require_relative '../helpers/bot_action'
require_relative '../db/database'
require_relative '../helpers/command_list'

class Command
  include BotAction
  include CommandList
  attr_accessor :bot, :message

  def initialize(name, bot)
    @name = name
    @bot = bot
  end

  def call(message)
    @message = message
    user = User.find_or_create(chat_id: message.chat.id, first_name: message.from.first_name,
                               last_name: message.from.last_name)
    logic(user, message)
  end

  def match?(command_name)
    @name == command_name
  end

  protected

  def logic(_user, message)
    send_message 'test'
  end
end
