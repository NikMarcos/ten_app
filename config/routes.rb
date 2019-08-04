TenApp::Application.routes.draw do
  # devise_for :users
  root to: "news#index"
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  devise_for :users, :controllers => { registrations: 'registrations' }
  ActiveAdmin.routes(self)
  resources :news
  resources :article
  resources :account do
    resources :images
  end
  # get 'account/:id', to: 'pages#account', as: 'account'
  # get 'accounts', to: 'pages#accounts'
  # post '/account/:id/images', to: 'images#create', as: 'save'

end
