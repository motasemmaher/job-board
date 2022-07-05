class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job

  enum status: { seen: "SEEN", not_seen: "NOT_SEEN" }
end
