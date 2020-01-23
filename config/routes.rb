Rails.application.routes.draw do
  get 'answers/new'
  get 'lessons/create'
  get 'lessons/show'
  get 'categories/index'
  namespace :admin do   #adminを追加するために追加された。
    get 'home', to:'pages#home'
    resources :users 
    resources :categories do
      resources :words
    end
  end

  root 'pages#home' #初めから表示されるページ。
  get "/about" =>  "pages#about"
  get "/signup"  =>  "users#new"
  
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"

  get '/index' , to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :categories

  resources :lessons do
    resources :answers
  end
end
