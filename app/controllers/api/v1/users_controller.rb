module Api
  module V1
    class UsersController < AuthController
      before_action :authentication, except: %i[login create]

      def login
        user = User.find_by_email(login_params[:email])
        p user
        if user.password_digest == login_params[:password_digest]
          # we encrypt user info using the pre-define methods in application controller
          token = encode_user_data(user_id: user.id, role: user.role, email: user.email)
          # return to user
          render json: { token: token }
        else
          render json: { message: "invalid credentials" }
        end
      end

      def index
        @users = User.all
        json_response(template: "api/v1/users/collection",
                      messages: ["success"])
      end

      def create
        @users = User.new(user_params)
        @users.save!
        json_response(template: "api/v1/users/collection",
                      messages: ["User registered"])
      end

      private

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password_digest)
      end

      # Only allow a list of trusted parameters through.
      def login_params
        params.require(:user).permit(:email, :password_digest)
      end
    end
  end
end
