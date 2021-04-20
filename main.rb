require 'dotenv/load'
require 'telegram/bot'
require_relative 'command_handler'

token = ENV['TELEGRAM_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  command_handler = CommandHandler.new bot
  bot.listen do |message|
    command_handler.call message
  end
end
