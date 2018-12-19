Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :mentors, only: [:create, :update, :destroy]
      end
      resources :mentors, only: [:index, :show]
    end
  end
end
