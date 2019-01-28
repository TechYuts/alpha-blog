Rails.application.routes.draw do
    
    root 'pages#homepage'
    get 'about', to: 'pages#about'
  
    resources :articles
    
    get 'signup', to: 'users#new'
    resources :users, except: [:new]
    
    resources :categories
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create' 
    delete 'logout', to: 'sessions#destroy'
end
