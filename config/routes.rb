# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: %i[create index update destroy show] do
        collection do
          get :by_category, :by_date
        end
      end
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login', # rubocop:disable Layout/FirstHashElementIndentation
    sign_out: 'logout',
    registration: 'signup'
  }, # rubocop:disable Layout/FirstHashElementIndentation
  controllers: { # rubocop:disable Layout/HashAlignment
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
