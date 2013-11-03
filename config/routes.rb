ErnestApp::Application.routes.draw do

  root :to => 'users#landing'

  get '/signup' => 'users#new'

  get '/login' => 'session#new'

  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy'

  delete '/users/:user_id/documents/:id/delete' => 'documents#destroy', :as => 'delete_document'

  get '/users/:id/tags/:tag_id' => 'users#show', :as => 'tag'

  post '/users/:user_id/documents/:document_id/versions/:id/revert' => 'versions#revert', :as => 'revert_version'

  get '/users/:user_id/documents/:document_id//versions/:id' => 'versions#show', :as => 'version'

  get '/users/:id/preferences' => 'users#edit', :as => 'edit_user'

  post 'users/:user_id/documents/:document_id/editable/new' => 'editables#create', :as => 'user_document_editables'

  get '/users/:user_id/editables/:id/edit' => 'editables#edit', :as => 'editable'

  put '/users/:user_id/editables/:id/edit' => 'editables#update', :as => 'user_editable'

  get '/editables/:id' => 'editables#show', :as => 'editable_preview'

  # delete '/users/:user_id/editables/:id' => 'editables#destroy', :as => 'editable_remove'

  get '/request-access' => 'beta_invites#new', :as => 'beta_invites'

  post '/request-access' => 'beta_invites#create'

  #Dropbox
  match '/dropbox/authorize'   => 'dropbox#authorize' , :method => :get , :as => :dropbox_auth
  match '/dropbox/callback' => 'dropbox#callback' , :method => :get , :as =>  :dropbox_callback
  match '/dropbox/revoke' => 'dropbox#revoke' , :method => :get , :as =>  :dropbox_revoke


  resources :users do
    resources :documents
  end
  resources :session
end
#== Route Map
# Generated on 22 Oct 2013 11:11
#
#             signup GET    /signup(.:format)                              users#new
#              login GET    /login(.:format)                               session#new
#                    POST   /login(.:format)                               session#create
#             logout DELETE /logout(.:format)                              session#destroy
#    delete_document DELETE /users/:user_id/documents/:id/delete(.:format) documents#destroy
#                tag GET    /users/:id/tags/:tag_id(.:format)              users#show
#     user_documents GET    /users/:user_id/documents(.:format)            documents#index
#                    POST   /users/:user_id/documents(.:format)            documents#create
#  new_user_document GET    /users/:user_id/documents/new(.:format)        documents#new
# edit_user_document GET    /users/:user_id/documents/:id/edit(.:format)   documents#edit
#      user_document GET    /users/:user_id/documents/:id(.:format)        documents#show
#                    PUT    /users/:user_id/documents/:id(.:format)        documents#update
#                    DELETE /users/:user_id/documents/:id(.:format)        documents#destroy
#         user_lists GET    /users/:user_id/lists(.:format)                lists#index
#                    POST   /users/:user_id/lists(.:format)                lists#create
#      new_user_list GET    /users/:user_id/lists/new(.:format)            lists#new
#     edit_user_list GET    /users/:user_id/lists/:id/edit(.:format)       lists#edit
#          user_list GET    /users/:user_id/lists/:id(.:format)            lists#show
#                    PUT    /users/:user_id/lists/:id(.:format)            lists#update
#                    DELETE /users/:user_id/lists/:id(.:format)            lists#destroy
#              users GET    /users(.:format)                               users#index
#                    POST   /users(.:format)                               users#create
#           new_user GET    /users/new(.:format)                           users#new
#          edit_user GET    /users/:id/edit(.:format)                      users#edit
#               user GET    /users/:id(.:format)                           users#show
#                    PUT    /users/:id(.:format)                           users#update
#                    DELETE /users/:id(.:format)                           users#destroy
#      session_index GET    /session(.:format)                             session#index
#                    POST   /session(.:format)                             session#create
#        new_session GET    /session/new(.:format)                         session#new
#       edit_session GET    /session/:id/edit(.:format)                    session#edit
#            session GET    /session/:id(.:format)                         session#show
#                    PUT    /session/:id(.:format)                         session#update
#                    DELETE /session/:id(.:format)                         session#destroy
