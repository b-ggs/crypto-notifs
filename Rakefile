require 'sqlite3'
require 'active_record'
require 'yaml'

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate('db/migrate/')
  end

  desc 'Create the database'
  task :create do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
  end

  desc 'Drop the database'
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    options = {
      'database' => 'sqlite3',
      'schema_search_path'=> 'public'
    }
    admin_connection = connection_details.merge(options)
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end
