Rails.application.routes.draw do
	root "posts#index"
	get '/myposts', to: 'posts#myposts'
	get '/about', to: 'pages#about'
	get '/dashboard', to: 'pages#dashboard'
	
	resources :comments do
    resources :comments
  end
 
  resources :posts do
    resources :comments
  end

  devise_for :users, :controllers => { :registrations => 'registrations' }
end
