Rails.application.routes.draw do
  get  '/posts' => 'news#posts'
  get  '/get_posts' => 'news#post_get'
  post  '/post_add' => 'news#post_add'
  get  '/view_friends' => 'frinends#view'
  post 'add' => 'frinends#add'
  get 'add' => 'frinends#add'
  post '/add_friend' => 'frinends#add_friend'
  get '/messenger' => 'messenger#messenger'
  get '/dialog' => 'messenger#dialog'
  post '/dialog' => 'messenger#dialog'
  get '/send' => 'messenger#send_'
  get 'profile/me'
  get '/login' => 'session#login'
  root 'profile#me'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
