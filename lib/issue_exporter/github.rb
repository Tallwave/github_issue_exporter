module IssueExporting
  def self.api_url
    "https://api.github.com/repos/%s/%s/issues?access_token=%s"
  end

  def self.make_url(owner, repo, token)
    url_format = IssueExporting.api_url
    url_format % [owner, repo, token]
  end

  def self.make_uri(owner, repo, token)
    URI.parse IssueExporting.make_url(owner, repo, token)
  end
end
