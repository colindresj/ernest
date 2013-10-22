EarnestApp::Application.routes.draw do
  root :to => 'users#new'

  get '/signup' => 'users#new', :as => 'signup'

  get '/login' => 'session#new'

  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy', :as => 'logout'

  delete '/users/:user_id/documents/:id/delete' => 'documents#destroy', :as => 'delete_document'

  get '/users/:id/tags/:tag_id' => 'users#show', :as => 'tag'


  resources :users do
    resources :documents
  end
  resources :session
end
#== Route Map
# Generated on 21 Oct 2013 22:09
#
#             signup GET    /signup(.:format)                            users#new
#              login GET    /login(.:format)                             session#new
#                    POST   /login(.:format)                             session#create
#             logout DELETE /logout(.:format)                            session#destroy
#     user_documents GET    /users/:user_id/documents(.:format)          documents#index
#                    POST   /users/:user_id/documents(.:format)          documents#create
#  new_user_document GET    /users/:user_id/documents/new(.:format)      documents#new
# edit_user_document GET    /users/:user_id/documents/:id/edit(.:format) documents#edit
#      user_document GET    /users/:user_id/documents/:id(.:format)      documents#show
#                    PUT    /users/:user_id/documents/:id(.:format)      documents#update
#                    DELETE /users/:user_id/documents/:id(.:format)      documents#destroy
#              users GET    /users(.:format)                             users#index
#                    POST   /users(.:format)                             users#create
#           new_user GET    /users/new(.:format)                         users#new
#          edit_user GET    /users/:id/edit(.:format)                    users#edit
#               user GET    /users/:id(.:format)                         users#show
#                    PUT    /users/:id(.:format)                         users#update
#                    DELETE /users/:id(.:format)                         users#destroy
#      session_index GET    /session(.:format)                           session#index
#                    POST   /session(.:format)                           session#create
#        new_session GET    /session/new(.:format)                       session#new
#       edit_session GET    /session/:id/edit(.:format)                  session#edit
#            session GET    /session/:id(.:format)                       session#show
#                    PUT    /session/:id(.:format)                       session#update
#                    DELETE /session/:id(.:format)                       session#destroy
