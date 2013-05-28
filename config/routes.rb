Postit::Application.routes.draw do
  root to: 'posts#index'

#  get '/register', to: 'users#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

# command is the same as resources(:posts, {except: [:destroy]})
# It is a 'resources' method with two arguments
# the first argument is a symbol=> :posts
# second argument is a hash => except=> :destroy
	resources :posts, except: [:destroy] do
		member do
			post 'vote'
		end
		resources :comments do
			member do
				post 'vote'
			end
		end

	end

	resources :users, only: [:new, :create]

# get 'posts/new', to: 'posts#new'
# post 'posts', to: 'posts#create'
end
