Rails.application.routes.draw do
  get 'welcome/index'
  resources :groups do
    resources :spaces, :locations
  end

  resources :spaces

  root 'welcome#index'
end