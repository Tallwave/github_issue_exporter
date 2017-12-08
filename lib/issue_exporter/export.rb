# Copyright (c) 2015 Scott Williams

require "json"

module IssueExporting
  class Exporter

    attr_accessor :outputter

    def initialize(owner, repo, token = nil, options = { page_size: true })
      @owner = owner
      @repo = repo
      @token = token
      @options = options
      valid_option_keys = [:path, :multiple_files, :output_type]
      outputter_options = options.select { |k,v| valid_option_keys.include? k }
      @outputter = build_outputter outputter_options
    end

    def export
      error_handler = ErrorHandler.new
      url = IssueExporting.make_uri @owner, @repo, @token
      url.query += build_query_string @options
      response = Net::HTTP::get url
      if err = error_handler.error_message(response)
        error_handler.handle_error err
      else
        outputter.write response
      end
    end

    def build_query_string(options)
      values = {
        include_closed_issues: 'state=all',
        page_size: 'per_page=100'
      }
      qs = options.reduce([]) do |arr, kv| 
        key, val = kv
        query_value = values[key] if val
        if query_value.nil?
          arr
        else
          arr.push(query_value) unless query_value.nil?
        end
      end
      if qs == [] then return '' end
      return '&' + qs.join('&')
    end
    
    def build_outputter(outputter_options)
      output_type = outputter_options[:output_type] || 'file'
      case output_type
      when 'csv'
        return CsvOutputter.new(outputter_options)
      else
        return FileOutputter.new(outputter_options)
      end
    end
  end
end

