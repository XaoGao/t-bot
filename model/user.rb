require 'sequel'

class User < Sequel::Model
  def full_name
    "#{first_name} #{last_name}"
  end
end
