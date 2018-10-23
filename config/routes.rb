Rails.application.routes.draw do
  get 'feed' => 'epicenter#feed'
  get 'show_user' => 'epicenter#show_user'
  get 'now_following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  
  get 'book_index' => 'books#index'
  get 'show_book' => 'books#show'

  get 'index' => 'posts#index'
  get 'new' => 'posts#new'

  root 'epicenter#feed'


  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
