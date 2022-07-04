module Response
  def json_response(template:, status: :ok, messages: [], **)
    @messages = messages
    render template, formats: [:json], handlers: [:jbuilder], status: status
  end
end
