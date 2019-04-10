Rails.application.routes.draw do
  resources :leads
  resources :sub_packages
  resources :packages
  resources :sub_categories
  resources :categories do 
    collection do 
      post 'search'
    end
  end
  resources :profiles
  get 'home/index'
  devise_for :users, :controllers => { :registrations => "registrations"}
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
