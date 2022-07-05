module Api
  module V1
    class ApplicationsController < AuthController
      before_action :authentication unless Rails.env == "test"
      before_action :check_is_admin, only: %i[index show] unless Rails.env == "test"
      before_action :check_is_user, only: %i[create] unless Rails.env == "test"

      # GET  /api/v1/applications
      def index
        @applications = Application.all
        json_response(template: "api/v1/applications/collection",
                      messages: [I18n.translate("concept.messages.models.application.index")])
      rescue StandardError => e
        error(e, [I18n.translate("concept.errors.models.application.index")])
      end

      # GET  /api/v1/applications/:id
      def show
        @application = Application.find_by(id: params[:id])
        if @application
          @application.status = "SEEN"
          @application.save!
        end
        json_response(template: "api/v1/applications/object",
                      messages: [I18n.translate("concept.messages.models.application.show")])
      rescue StandardError => e
        error(e, [I18n.translate("concept.errors.models.application.show")])
      end

      # POST  /api/v1/applications
      def create
        @application = Application.new(application_params)
        @application.save!
        json_response(template: "api/v1/applications/object", status: :created,
                      messages: [I18n.translate("concept.messages.models.application.create")])
      rescue StandardError => e
        error(e, [I18n.translate("concept.errors.models.application.create")])
      end

      private

      # Only allow a list of trusted parameters through.
      def application_params
        params.permit(:job_id, :user_id)
      end
    end
  end
end
