Rails.application.routes.draw do
  resources :leads
  resources :sub_packages
  resources :packages
  resources :sub_categories
  resources :categories do 
    collection do 
      get 'search'
    end
  end
  resources :profiles
  get 'home/index'
  devise_for :users, :controllers => { :registrations => "registrations", sessions: "sessions"}
  #devise_for :users, :controllers => {sessions: 'sessions'}
  root 'home#index'
end
