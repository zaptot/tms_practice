Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"
  #

  #get 'jokes/randon', 'jokes#random'

  resource :jokes, only: [] do
    get :random
  end

  scope :jwt, controller: 'jwt' do
    scope :jokes, controller: 'jwt/jokes' do
      get :random
    end

    scope :users, controller: 'jwt/users' do
      get :confirm, as: :confirm_user
    end
  end

  patch 'change_locale' => 'locales#change_locale'

  scope :currencies, controller: 'currencies' do
    get '/', action: :index
    get :convert
  end
end
