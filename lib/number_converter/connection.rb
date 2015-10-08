require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host:     'localhost',
  database: 'number_converter',
  username: 'postgres',
  password: '9h439'
)

class CreateConversionsTable <ActiveRecord::Migration
  def up
    create_table :conversions do |t|
      t.string      :input_type
      t.string      :input
      t.string      :result
      t.timestamps null: false
    end
  end
end

if !ActiveRecord::Base.connection.table_exists?(:conversions)
  CreateConversionsTable.migrate(:up)
  puts "The table Conversions was created !!!"
end
