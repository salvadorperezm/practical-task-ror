Rails.application.routes.draw do
  get '/players', to: 'players#index'
  get '/players/new', to: 'players#new'
  get '/players/:id', to: 'players#show'
  get '/players/:id/edit', to: 'players#edit'
  get '/players/nationalities/:nationality', to: 'players#players_by_nationality'
  post '/players', to: 'players#create'
  patch '/players/:id', to: 'players#update', as: 'player'
  put '/players/:id', to: 'players#update'
  delete 'players/:id', to: 'players#destroy'
end
