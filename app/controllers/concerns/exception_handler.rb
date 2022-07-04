module ExceptionHandler
  def error(error, error_message)
    @errors = [error]
    json_response(template: "api/v1/lib/error", messages: [error_message])
  end
end
