class AuthController < ApiController

  def secret
    Rails.application.config_for(:auth)[:secret]
  end
  # turn user data (payload) to an encrypted string  [ B ]
  def encode_user_data(payload)
    JWT.encode payload, secret, "HS256"
  end

  # decode token and return user info, this returns an array, [payload and algorithms] [ A ]
  def decode_user_data(token)
    JWT.decode token, secret, true, algorithm: "HS256"
  end

  def authentication
    # making a request to a secure route, token must be included in the headers
    # getting user id from a nested JSON in an array.
    # find a user in the database to be sure token is for a real user
    # The barebone of this is to return true or false, as a middleware
    # its main purpose is to grant access or return an error to the user
    decode_data = decode_user_data(request.headers[:token])
    User.find(decode_data[0]["user_id"])
  rescue StandardError => e
    error(e, ["Invalid credentials"])
  end

  def get_user_role(token)
    decode_data = decode_user_data(token)
    if decode_data
      decode_data[0]["role"]
    else
      false
    end
  rescue StandardError => e
    false
  end

  def check_is_admin
    raise StandardError if get_user_role(request.headers[:token]) != "admin"

    true
  rescue StandardError => e
    error(e, ["invalid Authorization"])
  end

  def check_is_user
    raise StandardError if get_user_role(request.headers[:token]) != "user"

    true
  rescue StandardError => e
    error(e, ["invalid Authorization"])
  end
end
