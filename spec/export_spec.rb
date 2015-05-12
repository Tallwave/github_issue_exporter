require 'spec_helper'

describe 'Export Integrations:' do
  let (:owner) { "swilliams" }
  let (:repo) { "test-repo" }
  let (:token) { "abcdef" }

  describe 'file output' do
    let (:output_filename) {
      File.expand_path('../../issues.json', __FILE__)
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
      expect(File.exists? output_filename).to eq true
      expect(File.read(output_filename)).to eq mock_data
    end

    it 'handles errors gracefully' do
      exporter = IssueExporting::Exporter.new(owner, repo, token)
      error_hash = {"message" => "Bad credentials","documentation_url" => "https://developer.github.com/v3"}
      stub_request(:any, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: error_hash.to_json)
      expect { exporter.export() }.to raise_error SystemExit
      expect(File.exists? output_filename).to eq false
    end

    it 'allows custom output file' do
      custom_path = File.expand_path('../tmp', __FILE__)
      outputter = IssueExporting::FileOutputter.new(path: custom_path)
      outputter.write('test')
      tmp_filename = "#{custom_path}/issues.json"
      expect(File.exists? tmp_filename).to eq true
      File.delete tmp_filename
    end

    it 'writes multiple files when the flag is set' do
      options = { multiple_files: true }
      exporter = IssueExporting::Exporter.new(owner, repo, token, options)
      stub_request(:any, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: mock_data)
      exporter.export()
      dir = File.expand_path("../", output_filename)
      Dir.chdir dir
      file_count = Dir.glob("*.json").count
      expect(file_count).to eq 2
      File.delete "#{dir}/issue-1.json"
      File.delete "#{dir}/issue-2.json"
    end
  end

end
