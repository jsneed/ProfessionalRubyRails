Rails.application.routes.draw do
  get '/home', to: 'pages#home'

  #get 'pages/home'

  get 'welcome/index'

  resources :articles do
      resources :comments
  end

  # Tells the server which route to load at startup
  #root 'welcome#index'
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
