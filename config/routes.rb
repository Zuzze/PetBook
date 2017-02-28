Rails.application.routes.draw do

  resources :comments
  resources :pets
  #get 'sessions/create'
  get 'welcome/index'

  root 'welcome#index'

#Define which html.erb file the address ending links to
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/explore', to:'static_pages#explore'
  get '/news', to:'static_pages#news'

  get '/signup', to:'users#new'
  get '/addpet', to: 'pets#new'

  get '/login', to:'sessions#new'
  get '/petprofile', to:'pets#petprofile'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'


  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :pets

  resources :posts do
    resources :comments
    member do
      get 'like'
    end

  end
  resources :relationships, only: [:create, :destroy]

  
  #resources :account_activations, only: [:edit]
  #resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
