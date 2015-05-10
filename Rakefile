require 'rake/testtask'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :build do
  system "gem build github_issue_exporter.gemspec"
end
