class Baby < ApplicationRecord
  belongs_to :user

  has_many :feeds, dependent: :destroy
  has_many :bottle_feeds, dependent: :destroy

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :gender, inclusion: { in: %w[male female other], message: "%{value} is not a valid gender" }, allow_nil: true
end
