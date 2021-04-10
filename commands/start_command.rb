require_relative 'command'

class StartCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:START], bot
  end

  def logic(message)
    send_message text: "Hello"
  end
end
