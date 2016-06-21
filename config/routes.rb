Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  get '*path' => 'application#index'
  
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :users, shallow: true do
        resources :searches
      end
      resources :tags, only: [:create, :index]
    end
  end
end
