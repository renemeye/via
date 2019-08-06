Rails.application.routes.draw do
  resources :plus_city_zones
  resources :public_transit_stations
  resources :equalities
  resources :tarif_distances
  resources :tarif_points
  resources :ticket_scanner, only: [:index]

  resources :map, only: [:index]
  get '/map/:tarif/:from/:via/:to' => 'map#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
