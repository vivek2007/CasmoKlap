Rails.application.routes.draw do
  resources :leads
  resources :sub_packages
  resources :packages
  resources :sub_categories
  resources :categories do 
    collection do 
      get 'search'
      get 'search_by_category'
    end
  end
  resources :profiles
  post "sms" => "sms#send_sms"
  post "send_sms_for_register_user" => "sms#send_sms_for_register_user"
  get 'home/index'
  devise_for :users, :controllers => { :registrations => "registrations", sessions: "sessions"}
  #devise_for :users, :controllers => {sessions: 'sessions'}
  get "autocomplete_categories" => "categories#autocomplete_categories", as: "autocomplete_categories"
  get "find_near_area" => "categories#find_near_area", as: "find_near_area"
  root 'home#index'
end
