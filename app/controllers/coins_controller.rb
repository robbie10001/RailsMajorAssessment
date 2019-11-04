class CoinsController < ApplicationController 

    skip_before_action :verify_authenticity_token
    def buycoins
    
    end

    def predecimal

    end

    def postdecimal

    end

    def predecimalsearch

    end

    def postdecimalsearch

    end 
=begin we create a method denomination. Within this method we look at all coins. 
we then create an instance variable that searches through our coins for our coins based on denomination.
=end
    def denomination
        params[:coin]
        @coins = Coin.where(denomination: params[:denomination])
    end

end 

=begin
1. we create a variable called coins that includes all the elements within the coin table.
2. we use params so that we only look at the different denominations within our coin table.
3. we create a loop that goes through every coin denomination.
4. if the coin denomination does not equal the string "5 cents" we go to the next element in the hash.
5. otherwise, we print to the screen the 5 cents that we returned. 
6. 
=end
