require_relative '../helpers/bot_action'
require_relative '../db/database'
class Command
  include BotAction
  attr_accessor :bot, :message

  def initialize(name, bot)
    @name = name
    @bot = bot
  end

  def call(message)
    @message = message
    logic message
  end

  def match?(command_name)
    @name == command_name
  end

  protected

  def logic(message)
    send_message text: message
  end
end
