Rails.application.routes.draw do
  resources :events do
    collection do
      get :event, :as => 'event'
    end
  end
  devise_for :users
  root to: "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
