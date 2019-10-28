Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "/", to: "coins#index", as: "root"
get "/buycoins", to: "coins#buycoins", as: "buycoins"
get "/buycoins/predecimal", to: "coins#predecimal", as: "predecimal"
get "/buycoins/postdecimal", to: "coins#postdecimal", as: "postdecimal"
get "/buycoins/postdecimal/search", to: "coins#predecimalsearch", as: "postdecimalsearch"
get "/buycoins/predecimal/search", to: "coins#predecimalsearch", as: "predecimalsearch"
get "/buycoins/postdecimal/:denomination", to: "coins#postdecimalsearch", as: "coindenomination"
get "/buycoins/contact", to: "coins#contact", as: "contactus"
get "/listing", to: "coins#listing", as: "listing"
post "/listing", to: "coins#listing", as: "newcoin"
patch "/listing", to: "coins#listing", as: "updatecoin"
delete "/listing", to: "coins#listing", as: "deletecoin"
get "/signin", to: "coins#signin", as: "signin"
patch "/signin", to: "coins#signin", as: "updateprofile"
delete "/signin", to: "coins#signin", as: "deleteprofile"
post "/signin", to: "coins#signin", as: "createprofile"


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



