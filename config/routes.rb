Rails.application.routes.draw do
  get 'signin/create'
  get 'signin/destroy'
  # get 'signup/create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
     # routes go here
      resources :users
      resources :messages
    end
  end

  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
