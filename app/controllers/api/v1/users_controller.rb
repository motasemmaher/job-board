module Api
  module V1
    class UsersController < AuthController
      before_action :authentication, except: %i[login create]

      # POST /api/v1/users/login
      def login
        @user = User.find_by_email(login_params[:email])
        if @user.password_digest == login_params[:password_digest]
          # we encrypt user info using the pre-define methods in application controller
          # return to user
          @user.token = encode_user_data(user_id: @user.id, role: @user.role, email: @user.email)
          json_response(template: "api/v1/users/object",
                        messages: ["success"])
        else
          render json: { message: "invalid credentials", success: false }
        end
      end

      # GET /api/v1/users
      def index
        @users = User.all
        json_response(template: "api/v1/users/collection",
                      messages: ["success"])
      rescue StandardError => e
        error(e, ["failed"])
      end

      # POST /api/v1/users
      # after create a new account it's need to login to generate a new token
      def create
        @users = User.new(user_params)
        @users.save!
        json_response(template: "api/v1/users/collection",
                      messages: ["User registered"])
      rescue StandardError => e
        error(e, ["failed"])
      end

      private

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:email, :role, :password_digest)
      end

      # Only allow a list of trusted parameters through.
      def login_params
        params.require(:user).permit(:email, :password_digest)
      end
    end
  end
end
