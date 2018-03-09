Rails.application.routes.draw do
	root "posts#index"
	get '/about', to: 'pages#about'
	
	resources :posts

	devise_for :users
end
