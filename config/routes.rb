Rails.application.routes.draw do
  root to: 'teams#index'
  resources :teams do
    member do
      patch :join
      delete :leave
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
