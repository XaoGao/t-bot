require_relative 'command'
class WeatherCommand < Command
  def initialize(bot)
    super CommandList::COMMANDS[:WEATHER], bot
  end

  def call(message)
    # send_message ext:
  end
end
