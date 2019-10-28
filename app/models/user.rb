class User < ApplicationRecord
    has_many :coins
    has_many :transactions
end
