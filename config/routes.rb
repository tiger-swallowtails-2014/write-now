Rails.application.routes.draw do
  # root to #index action of global controller
  root 'welcome#index'

  # login (sessions) routes with named helpers
  get '/login' => 'sessions#new', as: 'login_form'
  post '/login' => 'sessions#create', as: 'login'
  destroy '/logout' => 'sessions#destroy', as: 'logout'

  # nested users and projects resources
  resources :users do
    resources :projects
  end
end
