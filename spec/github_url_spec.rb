require 'spec_helper'

describe 'URL Building' do
  it 'builds a URL' do
    url = IssueExporting.make_url 'herp', 'derp', 'TOKEN'
    expect(url).to eq "https://api.github.com/repos/herp/derp/issues?access_token=TOKEN"
  end
end
