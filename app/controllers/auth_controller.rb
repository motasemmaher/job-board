class AuthController < ApiController
  SECRET = "auth-token".freeze

  def authentication
    # making a request to a secure route, token must be included in the headers
    decode_data = decode_user_data(request.headers[:token])

    user_id = nil
    # getting user id from a nested JSON in an array.
    user_id = decode_data[0]["user_id"] if decode_data
    # find a user in the database to be sure token is for a real user
    user = nil
    user = User.find(user_id) if user_id
    # Th e barebone of this is to return true or false, as a middleware
    # its main purpose is to grant access or return an error to the user
    if user
      true
    else
      render json: { message: "invalid credentials" }
    end
  end

  # turn user data (payload) to an encrypted string  [ B ]
  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  # decode token and return user info, this returns an array, [payload and algorithms] [ A ]
  def decode_user_data(token)
    JWT.decode token, SECRET, true, algorithm: "HS256"
  rescue StandardError => e
    puts e
  end

  def get_user_role(token)
    decode_data = decode_user_data(token)
    if decode_data
      decode_data[0]["role"]
    else
      false
    end
  end

  def check_is_admin
    if get_user_role(request.headers[:token]) == "admin"
      true
    else
      render json: { message: "invalid Authorization" }
    end
  end

  def check_is_user
    if get_user_role(request.headers[:token]) == "user"
      true
    else
      render json: { message: "invalid Authorization" }
    end
  end
end