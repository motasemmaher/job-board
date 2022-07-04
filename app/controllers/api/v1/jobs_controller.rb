module Api
  module V1
    class JobsController < ApiController
      # GET /api/v1/users
      def index
        @jobs = Job.all
        json_response(template: "api/v1/jobs/collection",
                      messages: ["success"])
      end

      # POST /api/v1/users
      def create
        @job = Job.new(job_params)
        @job.save!
        json_response(template: "api/v1/jobs/collection",
                      messages: ["Post a Job"])
      end

      private

      # Only allow a list of trusted parameters through.
      def job_params
        params.require(:job).permit(:title, :description)
      end
    end
  end
end
