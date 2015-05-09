# Copyright (c) 2015 Scott Williams

require 'net/http'
require 'json'

module IssueExporting
  class Exporter

    def initialize(owner, repo, token)
      @owner = owner
      @repo = repo
      @token = token
    end

    def export
      url = URI.parse make_url
      response = Net::HTTP::get url
      write_to_file response
    end

    private
    def make_url
      url_format = "https://api.github.com/repos/%s/%s/issues?access_token=%s"
      url_format % [@owner, @repo, @token]
    end

    def write_to_file(response_text)
      filename = "issues.json"
      File.open(filename, 'w') { |f| f.write response_text }
    end

  end
end


#url = URI.parse ""

