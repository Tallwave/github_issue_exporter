# Copyright (c) 2015 Scott Williams

module IssueExporting
  class FileOutputter
    def write(response_text)
      filename = "issues.json"
      path = File.expand_path("../#{filename}", __FILE__)
      File.open(path, 'w') { |f| f.write response_text }
    end
  end
end
