module Api
  module V1
    class JobsController < AuthController
      before_action :authentication, except: %i[index show]
      before_action :check_is_admin, only: %i[create update detory]

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
                      messages: ["success"])
      end

      # PUT /api/v1/users/:id
      def update
        @jobs = Job.where(id: params[:id]).update(job_params)
        if !@jobs.empty?
          json_response(template: "api/v1/jobs/collection",
                        messages: ["Job updated successfully"])
        else
          json_response(template: "api/v1/jobs/collection",
                        messages: ["The job not found"])
        end
      end

      # DELETE /api/v1/users/:id
      def destroy
        @jobs = Job.find_by(id: params[:id])&.destroy
        if @jobs
          json_response(template: "api/v1/jobs/collection",
                        messages: ["Job removed successfully"])
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
