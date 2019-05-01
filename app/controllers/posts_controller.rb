class PostsController < ApplicationController

  before_action :find_post, only: [:update, :edit]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
      if @post.update(post_params)
         redirect_to post_path(@post)
     else
       @errors = @post.errors.full_messages
       render :edit
     end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
