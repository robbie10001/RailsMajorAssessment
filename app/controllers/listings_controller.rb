class ListingsController < ApplicationController 
 
=begin
we create a method call newcoin
within this method we start in if/else statement
if a user is signed in, we look within our coins database
we then create a new coin for the signed in user 
after this has completed, we reload the listing page. 

if the user is not signed in. 
We print on our listing page "something ain't right" and we reload the listing page
=end
    def newcoin
        if user_signed_in?
            current_user.coins.create(
                denomination: params[:denomination], 
                price: params[:price],
                condition: params[:condition],
                description: params[:description],
                mint_year: params[:mint_year],
                picture: params[:picture]
            )
            redirect_back(fallback_location: listing_path)
        else 
           # puts @newcoin.errors.full_messages 
            puts "something ain't right!"
            redirect_back(fallback_location: listing_path)
        end 
    end 
=begin
we create a method for the ability to show a coin. 
In this case we have called it listing.
In this method we create an instance variable.
This variable is then equal to the coins that a signed in user has.
=end
    def listing
        if user_signed_in?
            @usercoins = current_user.coins
        end 
    end 

    def updatecoin
        if user_signed_in?
            @coin = current_user.coins.find(params[:id])
            @coin.update(
                denomination: params[:coin][:denomination], 
                price: params[:coin][:price],
                condition: params[:coin][:condition],
                description: params[:coin][:description],
                mint_year: params[:coin][:mint_year])
                #picture: params[:picture]
            puts "Your Coin has sucessfully updated!"
            redirect_back(fallback_location: listing_path)
        else 
           # puts @newcoin.errors.full_messages 
            puts "something ain't right!"
            redirect_back(fallback_location: listing_path)
        end 
    end 

    def editcoin
        @cointoerase = current_user.coins.find(params[:id])
       @coin = Coin.find(params[:id])
 

    end 


=begin
 if user_signed_in?
            
            @coin = current_user.coins.find(params[:id])
            @coin.delete(
                coin: params[:coin], 
                )
                #picture: params[:picture]
            redirect_back(fallback_location: listing_path)
        else 
           # puts @newcoin.errors.full_messages 
            puts "something ain't right!"
            redirect_back(fallback_location: listing_path)
        end 
=end
    def destroycoin
        @coin = Coin.find(params[:id])
        @delete = current_user.coins.delete(params[:id])
        redirect_to listing_path
    
    end 
    def deletecoin
        if user_signed_in?
            @destroycoin = current_user.coins.find(params[:id])
            redirect_back(fallback_location: update_path)
        else 
           # puts @newcoin.errors.full_messages 
            puts "something ain't right!"
            redirect_back(fallback_location: listing_path)
        end 
    end 

    def update
        @coin = current_user.coins.find(params[:id])
        redirect_to(cointodelete_path)
        
    end 

 
=begin
we create a method search. We then get every coin based on its denomination.
If the search term entered matches any of our coin denominations then we list that coin and all the others of that denomination.
If the search term does not match any of our coin denominations, then we reload the page and return to the page "Please make sure to search with some data"
=end
    def search 
        denominationcontrol = Coin.all.pluck(:denomination)
        denominationcontrol.each do |coin| 
        if coin == nil then next end 
        if coin.slice(0...3) == params[:search].downcase.slice(0...3)
            redirect_to(coindenomination_path(coin)) 
            return 
        end
        end 
        redirect_back(fallback_location: buycoins_path, alert: "Please make sure to search with some data") 

    end 
    
    def signin

    end

    def cointodelete
        @cointoerase = current_user.coins.find(params[:id])

    end 

    def show
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @coin.title,
                description: @coin.description,
                amount: @coin.deposit * 100,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    listing_id: @coin.id
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id
    end

    def buycoin

    end

private 
   
end 