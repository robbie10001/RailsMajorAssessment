class ListingsController < ApplicationController 
    #def listing
     #  @newcoin = Coin.new
        
    #end 

   def uploadedcoin
      @newcoin = Coin.new
   end 
#
 #   end 



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
            #params[:coin]
            # @usercoin = Coin.new(params[:coin])
            current_user.coins.create(
                denomination: params[:denomination], 
                price: params[:price],
                condition: params[:condition],
                description: params[:description],
                mint_year: params[:mint_year]

            )
            redirect_back(fallback_location: listing_path)
            
        else 
            puts @newcoin.errors.full_messages 
            puts "something ain't right!"
            redirect_back(fallback_location: listing_path)
        end 
    end 

    def updatecoin

    end 


    def deletecoin

    end 
=begin
we create a method search. We then get every coin based on its denomination.
If the search term entered matches any of our coin denominations then we list that coin and all the others of that denomination.
If the search term does not match any of our coin denominations, then we reload the page and return to the page "Please make sure to search with some data"
=end
    def search 
        if Coin.all.pluck(:denomination).include?(params[:search]) == true 
            redirect_to(coindenomination_path(params[:search]))
        else 
            redirect_back(fallback_location: buycoins_path, alert: "Please make sure to search with some data") 
        end

    end 
end 