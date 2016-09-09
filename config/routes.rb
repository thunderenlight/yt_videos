Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

	resources :videos, only: [:index, :new, :create]
	root to: 'videos#index'

	get '/auth/:provider/callback', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
