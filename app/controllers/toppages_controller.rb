class ToppagesController < ApplicationController
  def index
    if logged_in?
      @todos = current_user.todos.order(id: :desc).page(params[:page])
      @tags = current_user.tags#.where(tag: params[:tag])
    end  
  end
end
