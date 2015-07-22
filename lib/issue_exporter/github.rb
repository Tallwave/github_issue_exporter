require "open-uri"

module IssueExporting
  def self.api_url
    "https://api.github.com/repos/%s/%s/issues?access_token=%s"
  end

  def self.make_url(owner, repo, token, options = {})
    url_format = IssueExporting.api_url
    root_url = url_format % [owner, repo, token]
    return root_url unless options[:include_closed_issues] == true
    root_url + "&state=all"
  end

  def self.make_uri(owner, repo, token, options = {})
    URI.parse IssueExporting.make_url(owner, repo, token, options)
  end

  def self.turn_options_into_querystring(options)
    querystring = ''
    options.each do |k, v|
      escaped_k, escaped_v = URI::encode(k), URI::encode(v)
      querystring += "#{escaped_k}=#{escaped_v}&"
    end
    querystring.chop
  end
end
