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
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
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
    @book_list = []

    Book.all.each do |book|
      if @user.book_list.include?(book.id)
        @book_list.push(book)
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
