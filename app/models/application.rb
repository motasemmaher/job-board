class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def apply_job; end
end
