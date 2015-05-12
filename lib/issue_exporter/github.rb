module IssueExporting
  def self.api_url
    "https://api.github.com/repos/%s/%s/issues?access_token=%s"
  end
end
