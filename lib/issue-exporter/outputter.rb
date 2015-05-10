# Copyright (c) 2015 Scott Williams

module IssueExporting
  class FileOutputter
    def initialize(options = {})
      @options = options
    end

    def write(response_text)
      path = @options[:path] || default_path
      path = "#{path}/#{default_filename}"
      File.open(path, 'w') { |f| f.write response_text }
    end

    private
    def default_path
      File.expand_path("../", __FILE__)
    end

    def default_filename
      "issues.json"
    end
  end
end
