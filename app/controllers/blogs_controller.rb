class BlogsController < ApplicationController
  def index
    @blogs = Blog.preload(:student)
  end

  def show
  end
end
