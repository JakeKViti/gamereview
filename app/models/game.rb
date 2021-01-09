class Game < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews



    validates :title, presence: true
    validates :genre, presence: true
    validates :developer, presence: true
    validates :age, presence: true
    validates :year_released, presence: true, numericality: {greater_than_or_equal_to: 0}

    #def self.alphabetized
    #    all.order('title asc')
    #end
    scope :alphabetized, -> { order('title asc')}
end
