Rails.application.routes.draw do
  get 'refresh/create'
  get 'signin/create'
  get 'signin/destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :show, :index, :create] do
      resources :messages, only: [ :show, :index]
      end

      resources :messages, only: [ :show, :index]  do
        resources :users, only: [ :show, :index, :create]  do
        resources :chats, only: [ :show, :index]
        end
      end

      resources :user_chats, only: [ :show, :index]  do
        resources :users, only: [ :show, :index, :create]  do
          resources :chats, only: [ :show, :index]
        end
      end

    end
  end


  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy


end
