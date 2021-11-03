# frozen_string_literal: true

Rails.application.routes.draw do
  get '/acmv_pray', to: 'spa/pray#new'

  namespace :api do
    namespace :v1 do
      post 'prays/create'
    end
  end

  resources :prays

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
