require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host:     'localhost',
  database: 'number_converter',
  username: 'postgres',
  password: '9h439'
)

class CreateConverterTable <ActiveRecord::Migration
  def up
    create_table :converters do |t|
      t.primary_key :id
      t.string      :input_type
      t.string      :input
      t.string      :result
      t.timestamps  :converted_at
    end
  end
end

if !ActiveRecord::Base.connection.table_exists?(:converters)
  CreateStudySessionsTable.migrate(:up)
  puts "The table Converter was created !!!"
end

class Converter < ActiveRecord::Base

end



