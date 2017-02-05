Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "playlist_inverter#index"
  get "/invert", to: "playlist_inverter#invert_index"
  post "/invert", to: "playlist_inverter#invert_now", as: "inverted"
end
