Rails.application.routes.draw do
  namespace :church do
    namespace :api do
      namespace :v1 do
        get 'pray_petitions/index'
        post 'pray_petitions/create'
        delete 'pray_petition/:id', to: 'pray_petitions#delete'
      end
    end
  end

  namespace :church do
    resources :pray_petitions
  end

  devise_for :users, skip: [:registrations] do #I'm not going to allow registrations for now
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
