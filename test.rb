require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host:     'localhost',
  database: 'number_converter',
  username: 'postgres',
  password: '9h439'
)

class Converter < ActiveRecord::Base

end

converter = Converter.new(:input_type => 'roman', :input => 'VII', :result => '7', :converted_at => Time.current)
converter.save
p.errors.messages
p Converter.all
