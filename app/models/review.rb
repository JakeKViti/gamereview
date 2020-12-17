class Review < ApplicationRecord
    belongs_to :game
    belongs_to :user

    validates :title, presence: true, length: { maximum: 25 }
    validates :body, presence: true
    validates :rating, presence: true, numericality: { only_integer: true }
end
