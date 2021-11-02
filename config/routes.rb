Rails.application.routes.draw do
  scope :api do
    devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' },
               controllers: { sessions: 'api/users/sessions', registrations: 'api/users/registrations' }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
