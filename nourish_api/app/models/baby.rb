class Baby < ApplicationRecord
  belongs_to :user

  has_many :feeds, dependent: :destroy
  has_many :bottle_feeds, dependent: :destroy
  
end
