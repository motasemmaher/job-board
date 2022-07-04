module Api
  module V1
    class ApplicationsController < AuthController
      before_action :authentication
      before_action :check_is_admin, only: %i[index show]
      before_action :check_is_user, only: %i[create]
      # GET  /api/v1/applications
      def index
        @applications = Application.all
        json_response(template: "api/v1/applications/collection",
                      messages: ["success"])
      end

      # GET  /api/v1/applications/:id
      def show
        @applications = Application.find(id: params[:id])
        json_response(template: "api/v1/applications/collection",
                      messages: ["success"])
      end

      def new
        @applications = Application.new
      end

      # POST  /api/v1/applications
      def create
        @applications = Application.new(application_params)
        @applications.save!
        json_response(template: "api/v1/applications/collection",
                      messages: ["success"])
      end

      private

      # Only allow a list of trusted parameters through.
      def application_params
        params.require(:application).permit(:job_id, :user_id)
      end
    end
  end
end
