require_relative 'command'

class WeatherCommand < Command
  def initialize(bot)
    @name = CommandList::COMMANDS[:WEATHER]
    super @name, bot
  end

  def call(message)
    send_message message, 'test weather'
  end
end
