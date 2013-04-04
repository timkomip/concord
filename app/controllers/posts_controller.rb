class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts
  end
  def new
    #if the user id in params is in session
    if session[params[:user_id]]
      @post = User.find(params[:user_id]).posts.new
    else
      redirect_to :index
    end
  end
  def create
    @post = User.find(params[:user_id]).posts.new(params[:post])
    if @post.save
      redirect_to :index, :notice => "Signed up!"
    else
      render :new, :alert => 'Your post was not posted!'
    end
  end

end
