class Feed < ApplicationRecord
  belongs_to :user
  belongs_to :baby

  validates :feed_type, presence: true, inclusion: { in: %w[bottle breast] }
  validates :ounces, presence: true, if: -> { feed_type == "bottle" }
  validates :length, presence: true, if: -> { feed_type == "breast" }
end
