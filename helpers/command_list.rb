require_relative '../commands/start_command'
require_relative '../commands/stop_command'
require_relative '../commands/date_of_birth/date_of_birth_command'
require_relative '../commands/date_of_birth/add_date_of_birth_command'
module CommandList
  COMMANDS = {
    START:         '/start',
    STOP:          '/stop',
    WEATHER:       '/weather',
    DATE_OF_BIRTH: '/date_of_birth',
    ADD_DATE_OF_BIRTH: 'add_date_of_birth'
  }.freeze

  def self.init_commands(bot)
    [
      StartCommand.new(bot),
      StopCommand.new(bot),
      DateOfBirthCommand.new(bot),
      AddDateOfBirthCommand.new(bot)
    ]
  end
end
