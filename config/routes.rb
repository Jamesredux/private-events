Rails.application.routes.draw do


 
 	

 	root 'static_pages#home'
 	
  get '/about',				to: 'static_pages#about'
  get '/signup', 			to: 'users#new'
  post '/signup', 		to: 'users#create'
  get '/login', 			to: 'sessions#new'
  post '/login', 			to: 'sessions#create'
  delete '/logout', 	to: 'sessions#destroy'
  get '/attend/:id',  to: 'event_attendees#new'
  post '/attend/',  to: 'event_attendees#create'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :events 
end
