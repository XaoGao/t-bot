require_relative './commands/stop_command'
require_relative './commands/start_command'
require_relative './helpers/command_list'

class CommandHandler
  def initialize(bot)
    @bot = bot
    @commands_list = init_commands
  end

  def call(message)
    if message_is_command? message.text
      command(message.text).call message
    end
  end

  private

  def init_commands
    [StartCommand.new(@bot), StopCommand.new(@bot)]
  end

  def command(command_name)
    @commands_list.find { |com| com.match? command_name }
  end

  def message_is_command?(text)
    CommandList.COMMANDS.any? { |com| com[1] == text }
  end
end
