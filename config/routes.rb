Rails.application.routes.draw do
  #devise_for :users, :controllers => {:registrations => "registrations"}
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_scope :user do
  get 'login', to: 'devise/sessions#new'
end
root to: 'pages#index'

resources :posts do
  collection do
    get 'hobby'
    get 'study'
    get 'team'
  end
end

devise_scope :user do
  get 'signup', to: 'devise/registrations#new'
end

#get :omniauth_callbacks , to: 'omniauth_callbacks#twitter'
#get 'users/auth/:provider/callback', to: 'sessions#create'

end
