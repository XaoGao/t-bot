require 'sequel'
require_relative './user'

class Vacation < Sequel::Model
  many_to_one :user
  def interval
    "#{start_with.strftime('%F')} - #{until_the_end.strftime('%F')}"
  end
end
