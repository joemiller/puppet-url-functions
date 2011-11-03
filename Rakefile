require 'rake'

require 'rspec/core/rake_task'
desc "run rspec tests"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
  end
end

task :default => :spec