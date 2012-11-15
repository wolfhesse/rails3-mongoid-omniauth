Rails3MongoidOmniauth::Application.routes.draw do
  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/twsignin' => 'sessions#new_tw', :as => :twitter_signin
  match '/fbsignin' => 'sessions#new_fb', :as => :facebook_signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
