module RequestSpecHelper
  # Parse JSON response to ruby hash
  def parsed_json
    JSON.parse(response.body)
  end

  # Convert to GraphQl Query
  def graphql_query(type: nil, name: nil, args: nil, payload: nil)
    args_str = "input: {#{args.map { |k, v| v.is_a?(String) ? "#{k}: \"#{v}\"" : "#{k}: #{v}" }&.join(", ")}}" if args

    payload_str = payload&.join(", ")

    type&.downcase == "mutation" ? "mutation{#{name}(#{args_str}){#{payload_str}}}" : query(name, args_str, payload_str)
  end

  def query(name, args_str, payload_str)
    args_str ? "query{#{name}(#{args_str}){#{payload_str}}}" : "query{#{name}{#{payload_str}}}"
  end
end
