Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#pages_controller
get "/", to: "pages#index", as: "root"
#coins_controller
get "/buycoins", to: "coins#buycoins", as: "buycoins"
get "/buycoins/predecimal", to: "coins#predecimal", as: "predecimal"
get "/buycoins/postdecimal", to: "coins#postdecimal", as: "postdecimal"
get "/buycoins/postdecimal/search", to: "coins#postdecimalsearch", as: "postdecimalsearch"
get "/buycoins/predecimal/search", to: "coins#predecimalsearch", as: "predecimalsearch"
get "/buycoins/postdecimal/:denomination", to: "coins#denomination", as: "coindenomination"
get "/buycoins/predecimal/:denomination", to: "coins#predenomination", as: "precoindenomination"
get "/buycoins/contact", to: "coins#contact", as: "contactus"
#lisings_controller
get "/listing", to: "listings#listing", as: "listing"
post "/listing", to: "listings#newcoin", as: "newcoin"
patch "/listing", to: "listings#updatecoin", as: "updatecoin"
delete "/listing", to: "listings#deletecoin", as: "deletecoin"
post "/buycoins", to: "listings#search", as: "buypagesearch"
post "/buycoins/predecimal", to: "listings#search", as: "predecimalpagesearch"
post "/buycoins/postdecimal", to: "listings#search", as: "postdecimalpagesearch"
#post "/coins", to: "listings#listing"
#get "/coinses", to: "listings#listing"

#post   method listing  "coins"
#users controller(don't need this because of devise)
get "/signin", to: "users#signin", as: "signin"
patch "/signin", to: "users#updateprofile", as: "updateprofile"
delete "/signin", to: "users#deleteprofile", as: "deleteprofile"
post "/signin", to: "users#createprofile", as: "createprofile"

post "/buycoins/postdecimal/:denomination", to: "coins#findcoins", as: "coinage"


=begin
get "/forsale", to: "coins#forsale", as: "forsale"
post "/forsale", to: "coins#forsale", as: "listcoin"
patch "/forsale", to: "coins#forsale", as: "updatecoin"
delete "/forsale", to: "coins#forsale", as: "deletecoin"
get "/listing", to: "coins#listing", as: "listing"
get "/signin", to: "coins#signin", as: "signin"
post "/signin", to: "coins#signin", as: "updateprofile"
delete "/sigin", to: "coins#signin", as: "deleteprofile"
post "/signin", to: "coins#signin", as: "createprofile"
=end



end 



