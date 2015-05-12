# Copyright (c) 2015 Scott Williams

require 'net/http'
require 'json'

module IssueExporting
  class Exporter

    attr_accessor :outputter

    def initialize(owner, repo, token = nil, options = {})
      @owner = owner
      @repo = repo
      @token = token
      @outputter = FileOutputter.new options
    end

    def export
      url = URI.parse make_url
      response = Net::HTTP::get url
      if err = error_message(response)
        handle_error err
      else
        outputter.write response
      end
    end

    private
    def error_message(response_text)
      response_object = JSON.parse response_text
      if response_object.is_a? Hash
        response_object["message"]
      end
    end

    def handle_error(error_message)
      abort "ERROR: #{error_message}"
    end

    def make_url
      url_format = IssueExporting.api_url
      url_format % [@owner, @repo, @token]
    end
  end
end

