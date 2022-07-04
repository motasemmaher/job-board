require "bcrypt"

class User < ApplicationRecord
  include BCrypt
  has_secure_password

  attr_accessor :token

  has_many :applications
  has_many :jobs, through: :applications
end
