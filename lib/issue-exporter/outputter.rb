# Copyright (c) 2015 Scott Williams

module IssueExporting
  class FileOutputter
    def initialize(options = {})
      @options = options
    end

    def write(response_text)
      path = @options[:path] || default_path
      File.open(path, 'w') { |f| f.write response_text }
    end

    private
    def default_path
      filename = "issues.json"
      File.expand_path("../#{filename}", __FILE__)
    end
  end
end
