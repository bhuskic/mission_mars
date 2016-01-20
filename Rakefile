require 'rspec/core'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: [:spec]

desc 'Run all specs in spec directory'
RSpec::Core::RakeTask.new

desc 'Ruby static code analyzer'
RuboCop::RakeTask.new
