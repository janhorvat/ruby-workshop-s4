Rails.application.routes.draw do
  resources :cats, only: [:create] do
    get :random, on: :collection
  end
end
