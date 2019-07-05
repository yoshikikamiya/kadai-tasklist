Rails.application.routes.draw do
 
    root to:'tasks#index'
    
     resources :tasks
    

    
    
    get 'signup', to: 'users#new'
    resources :users, only:[:index,:show,:new,:create] do
        member do
            get :followings
            get:followers
        end
        collection do
            get :search
        end
    end 
    
    resources :tasks, only: [:create, :destroy]
    resources:relationships,only:[:create,:destroy]
end
