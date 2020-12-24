class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :games, through: :reviews

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
