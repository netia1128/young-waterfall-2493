Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  resources :actors
  resources :studios


  get '/movies/:movie_id/actors/new', to: 'actors#new'
end
