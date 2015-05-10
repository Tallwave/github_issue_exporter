require 'spec_helper'

describe 'Integrations:' do
  let (:owner) { "swilliams" }
  let (:repo) { "test-repo" }
  let (:token) { "abcdef" }

  describe 'file output' do
    let (:output_filename) { 
      File.expand_path('../../lib/issue-exporter/issues.json', __FILE__)
    }

    let (:mock_data) {
      mock_file = File.expand_path('../fixtures/issues.json', __FILE__)
      File.read mock_file
    }

    before(:each) do
      if File.exists? output_filename
        File.delete output_filename
      end
    end

    after(:each) do
      if File.exists? output_filename
        File.delete output_filename
      end
    end

    it 'puts it all in one file by default' do
      exporter = IssueExporting::Exporter.new(owner, repo, token)
      stub_request(:any, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: mock_data)
      exporter.export()
      puts "checking #{output_filename}"
      expect(File.exists? output_filename).to eq true
    end
  end

end
