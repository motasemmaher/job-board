require "bcrypt"

class User < ApplicationRecord
  has_many :applications
  has_many :jobs, through: :applications

  include BCrypt
  has_secure_password
end
