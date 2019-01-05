Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/github', to: 'authentication#create', format: false

  namespace :api do
    namespace :v1 do
      resources :mentors, only: [:create, :index, :show, :update, :destroy]
      resources :students, only: [:create, :index, :show, :update, :destroy]
      resources :student_mentors, only: [:create, :index, :show, :update, :destroy]

      namespace :admin do
        resources :mentors, only: [:index, :show, :update, :destroy]
      end
    end
  end
end
