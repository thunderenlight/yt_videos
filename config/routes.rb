Rails.application.routes.draw do

  # get 'video_uploads/new'

  # get 'video_uploads/create'

  # get 'sessions/create'

  # get 'sessions/destroy'

	resources :videos, only: [:index, :new, :create]
	resources :video_uploads, only: [:new, :create]

	get '/auth/:provider/callback', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy', as: :logout
	
	root to: 'videos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
