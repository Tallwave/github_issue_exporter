require 'spec_helper'

describe 'Import Integrations:' do
  let (:owner) { "swilliams" }
  let (:repo) { "test-repo" }
  let (:token) { "abcdef" }

  let (:mock_response) {
    mock_file = File.expand_path('../fixtures/import_result.json', __FILE__)
    File.read mock_file
  }

  let (:issue_path) {
    File.expand_path('../fixtures/issues.json', __FILE__)
  }

  let (:mock_bad_response) {
    mock_file = File.expand_path('../fixtures/error_response.json', __FILE__)
    File.read mock_file
  }

  it 'inserts a single issue' do
    stub_request(:post, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: mock_response)
    importer = IssueExporting::Importer.new([issue_path], owner, repo, token)
    expect { importer.import() }.to output('').to_stdout
  end

  it 'inserts multiple issues'

  it 'handles errors gracefully' do
    stub_request(:post, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: mock_bad_response, status: 403)
    importer = IssueExporting::Importer.new([issue_path], owner, repo, token)
    expect { importer.import() }.to raise_error SystemExit
  end
end
