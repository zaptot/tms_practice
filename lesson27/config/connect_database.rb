require 'pg'
require 'active_record'

DATABASE_CONFIG_FILE_NAME = 'database.yml'
DATABASE_CONFIG_PATH = File.join(File.dirname(__FILE__ ), DATABASE_CONFIG_FILE_NAME)
DB_CONFIG = YAML.load(File.read(DATABASE_CONFIG_PATH))

ActiveRecord::Base.establish_connection(
  adapter:  DB_CONFIG['adapter'],
  host:     DB_CONFIG['host'],
  database: DB_CONFIG['database']
)
