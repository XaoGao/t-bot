require 'sequel'
require_relative './vacation'

class User < Sequel::Model
  one_to_many :vacations
  def full_name
    "#{first_name} #{last_name}"
  end

  def show_vacations
    result = ''
    vacations.each do |v|
      result += v.interval
    end
    result
  end
end
