# Copyright (c) 2015 Scott Williams

module IssueExporting
  class FileOutputter
    def initialize(options = {})
      @options = options
    end

    def write(response_text)
      path = @options[:path] || default_path
      write_single_file path, response_text
    end

    private
    def default_path
      File.expand_path("../", __FILE__)
    end

    def default_filename
      "issues.json"
    end

    def write_single_file(dir, response_text)
      path = "#{dir}/#{default_filename}"
      File.open(path, 'w') { |f| f.write response_text }
    end
  end
end
