class CommentsController < ApplicationController
  def index
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments 
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end
  
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(params[:comment])
    if @comment.save
      redirect_to @blog, notice:"comment created"
    end
  end
end
