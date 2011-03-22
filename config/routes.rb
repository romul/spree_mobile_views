Rails.application.routes.draw do
  match "/search" => "products#search", :as => :search
end
