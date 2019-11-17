Rails.application.routes.draw do
	root 'home#index'
	get 'about', to: 'home#about'
	resources :articles

	get 'signup', to: 'users#new'
	# resources :users, except: [:new]
	post 'users' , to: 'users#create'
end
