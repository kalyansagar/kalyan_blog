class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
