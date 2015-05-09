# Copyright (c) 2015 Scott Williams

require 'net/http'
require 'json'

def make_url(owner, repo, token)
  url_format = "https://api.github.com/repos/%s/%s/issues?access_token=%s"
  url_format % [owner, repo, token]
end



#url = URI.parse ""

