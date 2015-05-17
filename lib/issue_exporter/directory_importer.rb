module IssueExporting
  class DirectoryImporter
    def initialize(directory, owner, repo, token)
      @directory = directory
      @owner = owner
      @repo = repo
      @token = token
    end

    def import
      files = Dir.glob "#{@directory}/*.json"
      importer = IssueExporting::Importer.new(files, @owner, @repo, @token)
      importer.import
    end
  end
end
