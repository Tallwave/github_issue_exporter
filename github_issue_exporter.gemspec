$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'issue_exporter'

Gem::Specification.new do |s|
  s.name                  = 'github_issue_exporter'
  s.version               = IssueExporting::VERSION
  s.required_ruby_version = '>= 2.0'
  s.date                  = '2017-12-04'
  s.summary               = 'Tools to export GitHub Issues'
  s.description           = <<-HERE
    Export or Import issues from a GitHub repository.
  HERE
  s.license               = 'MIT'
  s.authors               = ['Scott Williams']
  s.email                 = 'scott@swilliams.me'
  s.homepage              = 'https://github.com/Tallwave/github_issue_exporter'
  s.files                 = Dir['{bin,lib}/**/*'] + ['github_issue_exporter.gemspec']
  s.executables           = ['export-github-issues', 'import-github-issues']
  s.extra_rdoc_files      = ['LICENSE', 'README.md']
  s.require_paths         = ['lib']
end
