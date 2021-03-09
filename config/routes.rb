Rails.application.routes.draw do
  resources :competitions, only: [:index, :show] do
    resources :teams, only: [:new, :create]
  end
end
