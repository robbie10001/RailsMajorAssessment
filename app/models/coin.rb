class Coin < ApplicationRecord
   belongs_to :user
   has_one :transaction

end


