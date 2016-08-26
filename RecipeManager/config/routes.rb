Rails.application.routes.draw do
    get '/home', to: 'pages#home'

    resources :recipes
    #All of these route listings can be replaced by the line above
    #get       '/recipes',             to: 'recipes#index'
    #get       '/recipes/new',         to: 'recipes#new',      as: 'new_recipe'
    #post      '/recipes',             to: 'recipes#create'
    #get       '/recipes/:id/edit',    to: 'recipes#edit',     as: 'edit_recipe'
    #patch     '/recipes/:id',         to: 'recipes#update'
    #get       '/recipes/:id',         to: 'recipes#show',     as: 'recipe'
    #delete    'recipes/:id',          to: 'recipes#destroy'

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
