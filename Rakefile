# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :db do
  desc 'Insert test data into our database'
  task :populate_development => :environment do
    DatabaseInitializer.populate_development
  end
end

desc 'Insert test data into our database'
task :create_tournament => :environment do
  DatabaseInitializer.create_tournament_from_names_file
end
