Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'frontpage#index'

  # Authentication
  get '/profile', to: 'user#index'
  match '/register', to: 'user#register', via: [:get, :post]
  match '/login', to: 'user#login', via: [:get, :post]
  match '/reset/request', to: 'user#request_password_reset', via: [:get, :post]
  match '/reset', to: 'user#reset_password', via: [:get, :post]
  get '/logout', to: 'user#logout'
  get '/login/liu_id', to: 'user#login_liu_id'
  get '/login/verify', to: 'user#verify_liu_id'


  # Orchestra
  get 'orchestra' => 'orchestra#index'
  match 'orchestra/register' => 'orchestra#register', via: [:get, :post]
  match 'orchestra/create' => 'orchestra#create', via: [:get, :post]
  get 'orchestra/orchestras' => 'orchestra#orchestras'
  get 'orchestra/:id' => 'orchestra#show'
  post 'orchestra/:id' => 'orchestra#update'
  match 'orchestra/:id/reset_code' => 'orchestra#reset_code', via: [:post]
  get 'orchestra/signup/:id' => 'orchestra#show_signup'
  get 'orchestra/verify' => 'orchestra#verify_code'

  # User management
  get 'manage/users' => 'user_management#index'
  get 'manage/users/:id' => 'user_management#show'
  post 'manage/users/:id' => 'user_management#update'

  # Controller
  get 'contact' => 'contacts#contact'
  get 'press' => 'contacts#press'

  # Let’s encrypt
  get '/.well-known/acme-challenge/:id' => 'lets_encrypt#challenge', as: :letsencrypt_challenge

  # Pages controller
  get '/:category(/:page)' => 'pages#index'

end
