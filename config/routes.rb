Rails.application.routes.draw do
  namespace :api do
    resources :trips, only: :create

    namespace :stats do
      get :weekly
      get :monthly
    end
  end
end
