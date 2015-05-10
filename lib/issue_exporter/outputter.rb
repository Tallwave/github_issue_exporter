# Copyright (c) 2015 Scott Williams

module IssueExporting
  class FileOutputter
    def initialize(options = {})
      @options = options
    end

    def write(response_text)
      path = @options[:path] || default_path
      if @options[:multiple_files]
        write_multi_file path, response_text
      else
        write_single_file path, response_text
      end
    end

    private
    def default_path
      Dir.pwd
    end

    def default_filename
      "issues.json"
    end

    def write_single_file(dir, response_text)
      path = "#{dir}/#{default_filename}"
      File.open(path, 'w') { |f| f.write response_text }
    end

    def write_multi_file(dir, response_text)
      array_of_issues = JSON.parse response_text
      array_of_issues.each do |issue|
        issue_number = issue["number"]
        filename = "#{dir}/issue-#{issue_number}.json"
        File.open(filename, 'w') { |f| f.write issue.to_json }
      end
    end
  end
end
