EarnestApp::Application.routes.draw do
  root :to => 'users#new'

  get '/signup' => 'users#new', :as => 'signup'

  get '/login' => 'session#new'

  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy', :as => 'logout'

  resources :users
  resources :session
end
