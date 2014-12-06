Rails.application.routes.draw do
  root 'home#index'
  #List every journey
  get    '/journeys'    => 'journeys#index'
  
  # users routes
  resources :users, :path => '/' do
    resources :journeys do
      resources :locations
    end
  end

  #Authentication routes
  post   '/auth/login'  => 'auth#login'
  delete '/auth/logout' => 'auth#logout'
end
