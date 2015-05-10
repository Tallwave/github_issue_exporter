$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'issue_exporter'

Gem::Specification.new do |s|
  s.name                  = 'github_issue_exporter'
  s.version               = IssueExporting::VERSION
  s.required_ruby_version = '>= 2.0'
  s.summary               = 'Tools to export GitHub Issues'
  s.description           = <<-HERE
    Download Issues from a GitHub repository.
  HERE
  s.license               = 'MIT'
  s.author                = 'Scott Williams'
  s.email                 = 'scott@swilliams.me'
  s.homepage              = ''
  s.files                 = Dir['{bin,lib}/**/*'] + ['github_issue_exporter.gemspec']
  s.executables           = ['export-github-issues']
  s.extra_rdoc_files      = ['LICENSE', 'README.md']
  s.require_paths         = ['lib']
end
