RSpec.describe "Applications Requests", type: :request do
  # Initialize test data
  let!(:user) { FactoryBot.create(:user) }
  let!(:job) { FactoryBot.create(:job) }
  let!(:applications) { FactoryBot.create_list(:application, 10, user: user, job: job) }
  let!(:application) { applications[rand(0...applications.size)] }
  let!(:old_applications_count) { Application.all.count }
  let(:user_id) { user.id }
  let(:job_id) { job.id }
  let(:new_application_id) { Faker::Number.within(range: 10...100) }
  let(:application_id) { application.id }
  let(:status) { %i[seen not_seen].sample }

  # Test suite for all application
  describe "all application" do
    let(:params) { {} }

    context "when the request is valid" do
      # make HTTP get request before each example
      before { get "/api/v1/applications", params: params }

      include_examples "valid_request",
                       :ok,
                       "applications/collection",
                       I18n.translate("concept.messages.models.application.index")

      it "returns all objects" do
        # Note `json` is a custom helper to parse JSON response
        expect(parsed_json["data"]["applications"].size).to eq(applications.size)
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :get,
        #                  :index
      end
    end
  end

  # Test suite for show application
  describe "show application" do
    context "when the request is valid" do
      before { get "/api/v1/applications/#{application_id}" }

      include_examples "valid_request",
                       :ok,
                       "applications/object",
                       I18n.translate("concept.messages.models.application.show")

      it "returns an object" do
        # Note `json` is a custom helper to parse JSON response
        expect(parsed_json["data"]["application"]["id"]).to eq(application_id)
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :get,
        #                  :show
      end
      context "invalid id parameter" do
        let(:application_id) { "invalid_application_id" }
        before { get "/api/v1/applications/#{application_id}" }

        include_examples "invalid_parameter",
                         "errors/collection",
                         I18n.translate("concept.errors.models.application.show")
      end
    end
  end

  # Test suite for create application
  describe "create application" do
    let(:params) { { job_id: job_id, user_id: user_id } }

    context "when the request is valid" do
      before { post "/api/v1/applications", params: params }

      include_examples "valid_request",
                       :created,
                       "applications/object",
                       I18n.translate("concept.messages.models.application.create")

      it "creates object in the database" do
        expect(Application.all.count).to eq old_applications_count + 1
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :post,
        #                  :create
      end
      context "invalid user id parameter" do
        let(:user_id) { nil }
        before { post "/api/v1/applications", params: params }

        include_examples "invalid_parameter",
                         "errors/collection",
                         I18n.translate("concept.errors.models.application.create")
      end
      context "invalid job id parameter" do
        let(:job_id) { nil }
        before { post "/api/v1/applications", params: params }

        include_examples "invalid_parameter",
                         "errors/collection",
                         I18n.translate("concept.errors.models.application.create")
      end
    end
  end
end
