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

      fail UsageError, 'missing argument' if ARGV.empty?
      fail UsageError, 'incorrect number of arguments' if ARGV.count != 3
      ARGV.each_with_index { |arg, index| process_input arg, index }

    rescue UsageError => e
      puts "#{$PROGRAM_NAME}: #{e}\nTry `#{$PROGRAM_NAME} --help` for more information."
      exit false
    end
  end
end
