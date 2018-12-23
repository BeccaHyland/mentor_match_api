Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'auth'            => 'home#auth'
  post 'user_token'     => 'user_token#create'

  get '/users'          => 'users#index'
  get '/users/current'  => 'users#current'
  post '/users/create'  => 'users#create'
  patch '/users/:id'    => 'users#update'
  delete '/users/:id'   => 'users#destroy'

  namespace :api do
    namespace :v1 do
      resources :mentors, only: [:create, :index, :show, :update, :destroy]
    end
  end
end
