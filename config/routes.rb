Rails.application.routes.draw do
  root 'pages#home' #初めから表示されるページ。
  get "/about" =>  "pages#about"
  get "/signup"  =>  "users#new"
  
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

end
