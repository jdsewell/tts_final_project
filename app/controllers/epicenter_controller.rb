class EpicenterController < ApplicationController
  def feed
    if user_signed_in?
      @following_posts = []

  	  Post.all.each do |post|
  		  if current_user.following.include?(post.user_id) || current_user.id == post.user_id
  			   @following_posts.push(post)
  		  end
  	 end
    else
      redirect_to index_path
    end
    @posts = @following_posts
  end

  def show_user
    @user = User.find(params[:id])
    @shared_books_number = 0

    Book.all.each do |book|
      if @user.book_list.include?(book.id) && current_user.book_list.include?(book.id)
        @shared_books_number += 1
      end
    end

    @book = "book"
    if @shared_books_number != 1
      @book = "books"
    end
  end

  def recommended
    @following = []
    User.all.each do |user|
      if current_user.following.include?(user.id)
        @following.push(user)
      end
    end

    @recommended = []
    Book.all.each do |book|
      if current_user.book_list.include?(book.id) == false
        @following.each do |user|
          if user.liked_books.include?(book.id)
            @recommended.push(book)
          end
        end
      end
    end
  end

  def your_ratings
    @liked_books = []
    @disliked_books = []

    Book.all.each do |book|
      if current_user.liked_books.include?(book.id)
        @liked_books.push(book)
      end
      if current_user.disliked_books.include?(book.id)
        @disliked_books.push(book)
      end
    end
  end

  def like
    current_user.disliked_books.delete(params[:id].to_i)
    current_user.liked_books.push(params[:id].to_i)
    current_user.save
    Book.all.each do |book|
      if current_user.liked_books.include?(book.id)
        book.dislikes.delete(current_user.id)
        book.likes.push(current_user.id.to_i)
      end
      book.save
    end

    redirect_back(fallback_location: root_path)
  end

  def dislike
    current_user.liked_books.delete(params[:id].to_i)
    current_user.disliked_books.push(params[:id].to_i)
    current_user.save
    Book.all.each do |book|
      if current_user.disliked_books.include?(book.id)
        book.likes.delete(current_user.id)
        book.dislikes.push(current_user.id.to_i)
      end
      book.save
    end

    redirect_back(fallback_location: root_path)
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_back(fallback_location: root_path)
  end

  def following
    @user = User.find(params[:id])
    @following = []
    User.all.each do |user|
      if @user.following.include?(user.id)
        @following.push(user)
      end
    end
  end
  def followers
    @user = User.find(params[:id])
    @followers = []
    User.all.each do |user|
      if user.following.include?(@user.id)
        @followers.push(user)
      end
    end
  end

  def your_books
    @book_list =[]
    Book.all.each do |book|
      if current_user.book_list.include?(book.id)
        @book_list.push(book)
      end
    end
  end

  def user_books
    @user = User.find(params[:id])
    if @user.id == current_user.id
      redirect_to your_books_path(id: current_user.id)
    end

    @book_list = []

    Book.all.each do |book|
      if @user.book_list.include?(book.id)
        @book_list.push(book)
      end
    end
  end

  def shared_books
    @user = User.find(params[:id])
    @shared_books = []

    Book.all.each do |book|
      if @user.book_list.include?(book.id) && current_user.book_list.include?(book.id)
        @shared_books.push(book)
      end
    end
  end

  def add_book
    current_user.book_list.push(params[:id].to_i)
    current_user.save

    redirect_back(fallback_location: root_path)
  end

  def remove_book
    current_user.book_list.delete(params[:id].to_i)
    current_user.save

    redirect_back(fallback_location: root_path)
  end
end
