RSpec.shared_examples "invalid_parameter" do |json_schema, error_message, model|
  it "returns 'application/json' for header content type" do
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
  # it "returns '#{status}' for status code" do
  #   expect(response).to have_http_status(status)
  # end
  it "returns error message" do
    expect(response.body).to include(error_message)
  end
  it "matches error schema" do
    expect(parsed_json).to match_response_schema(json_schema)
  end
  if model
    it "returns error message for invalid id" do
      expect(response.body).to include(I18n.t("errors.find", model: model))
    end
  end
end
