Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "/", to: "coins#index", as: "root"
get "/buycoins", to: "coins#buycoins", as: "buycoins"
get "/buycoins/predecimal", to: "coins#predecimal", as: "predecimal"
get "/buycoins/postdecimal", to: "coins#postdecimal", as: "postdecimal"
get "/buycoins/postdecimal/search", to: "coins#predecimalsearch", as: "postdecimalsearch"
get "/buycoins/predecimal/search", to: "coins#predecimalsearch", as: "predecimalsearch"
get "/buycoins/postdecimal/:denomination", to: "coins#postdecimalsearch", as: "newcoin"
get "/buycoins/contact", to: "coins#contact", as: "contactus"


get "/forsale", to: "coins#forsale", as: "forsale"
post "/forsale", to: "coins#forsale", as: "listcoin"
patch "/forsale", to: "coins#forsale", as: "updatecoin"
delete "/forsale", to: "coins#forsale", as: "deletecoin"
get "/listing", to: "coins#listing", as: "listing"
get "/signin", to: "coins#signin", as: "signin"
post "/signin", to: "coins#signin", as: "updateprofile"
delete "/sigin", to: "coins#signin", as: "deleteprofile"
post "/signin", to: "coins#signin", as: "createprofile"


end 


=begin
post "/coins", to: "coins#create"
get "/coins/new", to: "coins#new", as: "new_coin"
get "/coins/:id/edit", to: "coins#edit", as: "edit_coin"
get "/coins/:id", to: "coins#show", as: "coin"
patch "/coins/:id", to: "coins#update"
put "/coins/:id", to: "coins#update"
delete "/coins/:id", to: "coins#destroy"
end
=end
