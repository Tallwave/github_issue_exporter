require 'net/http'
require 'json'

module IssueExporting
  class Importer
    def initialize(files)
      @files = files
    end

    def import
    end

    private
    def read_file(filename)
    end

    def create_issue
    end

  end
end
