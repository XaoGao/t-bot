require 'sequel'

DB = Sequel.connect('sqlite://db/tbot.db')

DB.create_table? :users do
  primary_key :id
  String   :first_name
  String   :last_name
  String   :username
  Integer  :chat_id
  DateTime :date_of_birth
  String   :action
end

DB.create_table? :vacations do
  primary_key :id
  foreign_key :user_id, :users
  DateTime :from
  DateTime :by
end
