class Coin < ApplicationRecord
    belongs_to :user
    has_one :payment
    has_one_attached :picture
end 

