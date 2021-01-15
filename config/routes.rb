Rails.application.routes.draw do
  get 'feedbacks/new'
  get 'feedbacks/create'
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    resource :gist, only: %i[create]
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, only: %i[index destroy]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, exept: :index
      end
    end
  end
end
