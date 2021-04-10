require_relative 'command'

class StopCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:STOP], bot
  end

  def logic(message)
    send_message text: "Bye"
  end
end
