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
