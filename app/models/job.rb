class Job < ApplicationRecord
  has_many :applications
  has_many :users, through: :applications

  # def postAJob
  #
  # end
end
