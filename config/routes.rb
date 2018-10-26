Rails.application.routes.draw do
  get 'feed' => 'epicenter#feed'
  get 'show_user' => 'epicenter#show_user'
  get 'now_following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  get 'following' => 'epicenter#following'
  get 'add' => 'epicenter#add_book'
  get 'remove' => 'epicenter#remove_book'
  get 'user_books' => 'epicenter#user_books'
  get 'your_books' => 'epicenter#your_books'
  
  get 'books' => 'books#index'
  get 'show_book' => 'books#show'
  get 'new_book' => 'books#new'

  get 'index' => 'posts#index'
  get 'new' => 'posts#new'

  root 'epicenter#feed'

  get 'all_users' => 'posts#users'

  resources :posts
  resources :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
