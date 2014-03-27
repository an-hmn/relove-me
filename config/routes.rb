ReloveMe::Application.routes.draw do
  root :to => 'pages#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/faq' => 'pages#faq'
  get '/search' => 'sales#search'
  post '/search' => 'sales#search'
  get '/result' => 'sales#result'
  get '/sales/:id/delete' => 'sales#destroy', :as => :sale_delete
  post '/sales/:id' => 'sales#update'
  # get '/items/:id' => 'items#show'
  resources :users, :items, :sales, :pages
end

