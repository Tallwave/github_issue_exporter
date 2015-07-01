require 'spec_helper'

describe 'IssueExporting' do
  describe '#turn_options_into_querystring' do
    it 'converts a hash to a string' do
      h = { "one" => "foo", "two" => "bar baz" }
      result = IssueExporting.turn_options_into_querystring h
      expect(result).to eq("one=foo&two=bar%20baz")
    end
  end
end
