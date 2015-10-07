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
      # better name would be conversions, this should be the case for the
      # class name too
      t.primary_key :id
      # migrations automatically add primary keys
      # due to this, the table creation fails
      t.string      :input_type
      t.string      :input
      t.string      :result
      t.timestamps  :converted_at
      # timestamps declaration automatically adds :created_at and :updated_at
      # columns, specifying the :converted_at name has no effect
      # If you want to add the converted_at column and use that, you should skip
      # the timestamps decalration and use
      # t.datetime :converted_at, but then this needs to be set manually on creation
      # another alternative would be to leave the timestamps and use the created_at
      # as the converted_at requirement
    end
  end
end

if !ActiveRecord::Base.connection.table_exists?(:converters)
  CreateStudySessionsTable.migrate(:up)
  # there's no such class, copy-paste?
  puts "The table Converters was created !!!"
end

class Converter < ActiveRecord::Base
  # this should be moved in it's own file

end



