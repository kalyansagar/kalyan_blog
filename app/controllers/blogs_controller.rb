class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to @blog, :notice=>"successfully created"
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @commentable = @blog
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog])
    redirect_to @blog, :notice=>"successfully updates"
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
    
  end
end
