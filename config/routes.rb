Rails.application.routes.draw do

  resources :imports do
    resources :mappings
    patch :run, on: :member
  end

  get 'users/index'

  devise_for :users, controllers: { invitations: 'devise/invitations' }, skip: [:registrations]
  as :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'documents#index'

  # public-facing routes
  resources :documents

  mount Qa::Engine => '/authorities'
end
