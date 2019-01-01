Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/github', to: 'authentication#create', format: false

  namespace :api do
    namespace :v1 do
      resources :mentors, only: [:create, :index, :show, :update, :destroy]
      resources :students, only: [:create, :index, :show, :update, :destroy]
    end
  end
end
