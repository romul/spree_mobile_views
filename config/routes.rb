Spree::Core::Engine.routes.draw do
  match "/search" => "products#search", :as => :search
end
