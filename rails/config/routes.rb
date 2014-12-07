Rails.application.routes.draw do
  root 'home#index'
  #List every journey
  namespace :api do
    resources :journeys, :only => [:index, :show]
  end
  # scope :path => 'api', :as => 'api' do
  #   resources :journeys, :only => [:index]
  # end

  # users routes
  namespace :api do
    resources :users, :path => '/' do
      resources :journeys do
        resources :locations
      end
    end
  end

  #Authentication routes
  post   '/auth/login'  => 'auth#login'
  delete '/auth/logout' => 'auth#logout'
end
