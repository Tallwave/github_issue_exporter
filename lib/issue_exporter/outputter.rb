# Copyright (c) 2015 Scott Williams

require 'csv'

module IssueExporting
  class BaseOutputter
    def initialize(options = {})
      @options = options
    end

    def write(response_text)
    end

    protected
    def default_path
      Dir.pwd
    end

    def default_filename
      "issues.json"
    end

    def write_file(dir, text)
      path = "#{dir}/#{default_filename}"
      File.open(path, 'w') { |f| f.write text }
    end
  end

  class CsvOutputter < BaseOutputter
    def write(response_text)
      path = @options[:path] || default_path
      array_of_issues = JSON.parse response_text
      keys = ["number", "title", "state", "user.login", "created_at", "updated_at", "closed_at", "url"]
      text = "Issue #,Title,State,Created By,Created At,Last Updated At,Closed At,GitHub URL\n"
      mapped_values = array_of_issues.map do |issue|
        values = keys.map do |key| 
          args = key.split '.'
          issue.dig(*args)
        end
        values.to_csv
      end
      csv_text = text + mapped_values.join("")
      write_file path, csv_text
    end

    protected
    def default_filename
      "issues.csv"
    end
  end

  class FileOutputter < BaseOutputter
    def write(response_text)
      path = @options[:path] || default_path
      if @options[:multiple_files]
        write_multi_file path, response_text
      else
        write_file path, response_text
      end
    end

    private
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
