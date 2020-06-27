Rails.application.routes.draw do
  root to: 'places#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    # root to: "devise/sessions#new"
  end

  resources :places do
    resources :reviews, shallow: true
    resources :photos, shallow: true
  end
end
