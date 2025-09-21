class User < ApplicationRecord
    has_secure_password

    has_many :babies
    has_many :feeds
    has_many :pumps
    has_many :achievements

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6 }

end
