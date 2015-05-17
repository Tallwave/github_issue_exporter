module IssueExporting
  class ErrorHandler
    def response_has_error(response)
      response.code.to_i > 299
    end

    def error_message(response_text)
      response_object = JSON.parse response_text
      if response_object.is_a? Hash
        response_object["message"]
      end
    end

    def handle_error(error_message, should_abort = true)
      msg = "ERROR: #{error_message}"
      if should_abort
        abort msg
      else
        puts msg
      end
    end
  end
end
