require_relative '../commands/start_command'
require_relative '../commands/stop_command'
require_relative '../commands/date_of_birth/date_of_birth_command'
require_relative '../commands/date_of_birth/add_date_of_birth_command'
require_relative '../commands/vacation/vaction_command'
require_relative '../commands/vacation/choose_action_vacation'
require_relative '../commands/vacation/add_vacation_command'
require_relative '../commands/vacation/remove_vacation_command'
module CommandList
  COMMANDS = {
    START:                  '/start',
    STOP:                   '/stop',
    WEATHER:                '/weather',
    DATE_OF_BIRTH:          '/date_of_birth',
    ADD_DATE_OF_BIRTH:      'add_date_of_birth',
    VACATION:               '/vacation',
    CHOOSE_ACTION_VACATION: 'choose action vacation',
    ADD_VACATION:           'add_vacation',
    REMOVE_VACATION:        'remove_vacation'
  }.freeze

  ACTIONS = {
    SHOW_VACATION: 'show_vacation',
  }.freeze

  def self.init_commands(bot)
    [
      StartCommand.new(bot),
      StopCommand.new(bot),
      DateOfBirthCommand.new(bot),
      AddDateOfBirthCommand.new(bot),
      VacationCommand.new(bot),
      ChooseActionVacationCommand.new(bot),
      AddVacationCommand.new(bot),
      RemoveVacationCommand.new(bot)
    ]
  end

  def self.find_command(command_name)
    COMMANDS.any? { |com| com[1] == command_name }
  end
end
