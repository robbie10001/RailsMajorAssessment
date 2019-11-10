class CoinsController < ApplicationController 
    before_action :set_coin, only: [:denomination, :predenomination]
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
        show = stripe 
        @session_id = session.id


    end

    def predenomination 
        show = stripe 
        @session_id = session.id

    end 

    def show
       
    end
    private
    
    def stripe

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @coin.denomination,
                description: @coin.description,
                amount: @coin.price,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    coin_id: @coin.id
                }
            },
            success_url: root_url,
            cancel_url: root_url + "buycoins"
        )

    end
    
    def set_coin
        @set_coin_params = params[:denomination]
        @coin = Coin.find_by(denomination: @set_coin_params)
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
