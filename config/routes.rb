Rails.application.routes.draw do
    resources :tasks

    root to:'tasks#index'
    
     
     get 'login', to: 'sessions#new'
     post 'login', to: 'sessions#create'
     delete 'logout',to:'sessions#destroy'
     
     

    
    get 'signup', to: 'users#new'
    resources :users, only:[:index,:show,:new,:create] 
    
    resources :users,only:[:create,:destroy]
end