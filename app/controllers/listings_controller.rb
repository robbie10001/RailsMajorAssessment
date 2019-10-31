class ListingsController < ApplicationController 
    def listing

    end 

    def newcoin
        params[:coin]
        @newcoin = Coin.create(condition: params[:description])
    end 

    def updatecoin

    end 


    def deletecoin

    end 

    def search 
        if Coin.all.pluck(:denomination).include?(params[:search]) == true 
            redirect_to(coindenomination_path(params[:search]))
        else 
            redirect_back(fallback_location: buycoins_path, alert: "Please make sure to search with some data") 
        end

    end 
end 