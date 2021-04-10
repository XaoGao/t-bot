require_relative 'command'

class StopCommand < Command
  def initialize(bot)
    @name = CommandList::COMMANDS[:STOP]
    super @name, bot
  end

  def logic(user, message)
    send_message text: "Bye, #{user.full_name}"
  end
end
