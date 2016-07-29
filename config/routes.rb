Rails.application.routes.draw do
  get 'home/index'

  get 'template/estimate'

  get 'template/estimate_subworking'

  get 'template/estimate_subworking_specialist'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
end
