require 'sequel'
require_relative './user'

class Vacation < Sequel::Model
  many_to_one :user
  def interval
    "#{from.strftime('%F')} : #{by.strftime('%F')}"
  end
end
