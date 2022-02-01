Rails.application.routes.draw do
  resources :twitters
  resources :instagrams
  resources :youtubes
  resources :youtube_contents
  #root :to => 'youtube_contents_controller#index"
  post 'youtubes/index'
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
