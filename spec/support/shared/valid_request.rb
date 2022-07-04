RSpec.shared_examples "valid_request" do |status, json_schema, message|
  it "returns 'application/json' for header content type" do
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
  it "returns '#{status}' for status code" do
    expect(response).to have_http_status(status)
  end
  it "matches schema" do
    expect(parsed_json).to match_response_schema(json_schema)
  end
  if message
    it "returns success message" do
      expect(response.body).to include(message)
    end
  end
end
