Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    unauthenticated do
      root "devise/sessions#new"
    end
    authenticated :user do
      root "pages#my_todo_items", as: :authenticated_root
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :todo_items, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
