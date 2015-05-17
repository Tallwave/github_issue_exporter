require 'spec_helper'

describe IssueExporting::DirectoryImporter do
  describe '#import' do
    it 'gets all the json files in a dir' do
      dir = File.expand_path('../fixtures', __FILE__)
      importer = IssueExporting::DirectoryImporter.new dir, "", "", ""
      allow_any_instance_of(IssueExporting::Importer).to receive(:import).and_return nil
      importer.import
    end
  end
end
