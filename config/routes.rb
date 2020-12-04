Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :tests do
  #   resources :questions
  # end
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  # resources :tests do
  #   get :beginner, on: :collection
  #
  #   member do
  #     post :stat
  #   end
  # end
end
