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
end
