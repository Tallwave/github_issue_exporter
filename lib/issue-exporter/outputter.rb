# Copyright (c) 2015 Scott Williams

module IssueExporting
  class FileOutputter
    def write(response_text)
      filename = "issues.json"
      File.open(filename, 'w') { |f| f.write response_text }
    end
  end
end
