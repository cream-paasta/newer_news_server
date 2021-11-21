Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'home#index'
  namespace :api do
    resources :posts do
      collection do
        get :user
      end
    end
    resources :issues do
      member do
        put :action
      end

      collection do
        get :user_issue_lists
      end
    end
    resources :gus
  end
  devise_for :users, path: 'api', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' },
             controllers: { sessions: 'api/users/sessions', registrations: 'api/users/registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
