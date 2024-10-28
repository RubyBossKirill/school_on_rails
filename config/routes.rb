Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/edit'
  get 'events/show'
  get 'events/delete'
  get 'events/create'
  post 'events/create'

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
