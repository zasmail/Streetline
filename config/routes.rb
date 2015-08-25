Rails.application.routes.draw do
  get 'welcome/index'
  resources :groups do
    resources :spaces
    resources :locations
  end
  root 'welcome#index'
end