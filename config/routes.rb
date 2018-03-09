Rails.application.routes.draw do
	root "posts#index"
	get '/about', to: 'pages#about'
	
	resources :comments do
    resources :comments
  end
 
  resources :posts do
    resources :comments
  end

	devise_for :users
end
