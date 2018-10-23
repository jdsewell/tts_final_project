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
end
