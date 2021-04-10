require_relative 'command'

class StartCommand < Command
  def initialize(bot)
    @name = CommandList::COMMANDS[:START]
    # @name = '/start'
    super @name, bot
  end

  def logic(user, message)
    send_message text: "Hello, #{user.full_name}"
  end
end
