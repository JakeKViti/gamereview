class Game < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, presence: true
    validates :genre, presence: true
    validates :developer, presence: true
    validates :age, presence: true
end
