class Review < ApplicationRecord
    belongs_to :game
    belongs_to :user
    accepts_nested_attributes_for :game
    accepts_nested_attributes_for :user

    #validates :title, presence: true, length: { maximum: 25 }
   # validates :body, presence: true
   # validates :rating, presence: true, numericality: { only_integer: true }, length: { maximum: 100 }


    end
