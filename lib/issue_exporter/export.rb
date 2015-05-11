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
      outputter.write response
    end

    private
    def make_url
      url_format = @token ? url_with_token : url_without_token
      url_format % [@owner, @repo, @token]
    end

    def url_with_token
      "#{url_without_token}?access_token=%s"
    end

    def url_without_token
      "https://api.github.com/repos/%s/%s/issues"
    end

  end
end

