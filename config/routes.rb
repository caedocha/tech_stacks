Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    end
  end
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index, :show, :create, :update, :destroy]
      resources :techs, only: [:index, :show, :create, :update, :destroy]

      post 'stack_techs/link'
      delete 'stack_techs/unlink'
    end
  end
  root 'homepage#index'
  get '/*path' => 'homepage#index'
end
