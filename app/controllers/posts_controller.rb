class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      redirect_to root_path, alert: 'can\'t left a post form blank'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: 'Post was deleted successfully.'
  end

  private

  def post_params
    params.require(:post).permit(:post)
  end
end
