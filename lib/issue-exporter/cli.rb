# Copyright (c) 2015 Scott Williams

require 'optparse'
require 'issue-exporter'

module IssueExporting
  module CLI

    def run
      begin
        OptionParser.new do |opts|
          define_options opts
          opts.on '-h', '--help' do
            puts usage
            exit
          end

          opts.on '--version' do
            puts about
            exit
          end

        end.parse!
      rescue OptionParser::ParseError => e
        raise UsageError, e
      end
    end

  end
end
