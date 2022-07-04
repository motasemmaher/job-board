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
        @jobs = Job.new(job_params)
        @jobs.save!
        json_response(template: "api/v1/jobs/collection",
                      messages: ["Post a Job"])
      end

      def update
        @jobs = Job.where(id: params[:id]).update(job_params)
        if !@jobs.empty?
          json_response(template: "api/v1/jobs/collection",
                        messages: ["Job Updated Successfully"])
        else
          json_response(template: "api/v1/jobs/collection",
                        messages: ["The job not found"])
        end
      end


      private

      # Only allow a list of trusted parameters through.
      def job_params
        params.require(:job).permit(:title, :description)
      end
    end
  end
end
