class TodosController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit,:show, :update, :destroy]
  
  def new
    @todo = Todo.new
    
  end
  
  def create
#binding.pry 
#params[:controller]
#params[:action]
#params[:todo][:tag] = params[:todo][:tag].to_i if params.present? && params[:todo].present? && params[:todo][:tag].present?

    @todo = current_user.todos.build(todo_params)
    #@todo = current_user.todos.build
    #@todo[:title] = params[:todo][:title]
    #@todo[:content] = params[:todo][:content]
    @todo[:tag_id] = params[:todo][:tag].to_i
    @todo.tag
    if @todo.save
      flash[:success] = '新しい予定を作成しました'
      redirect_to root_url
    else
      flash.now[:danger] = '予定の作成に失敗しました。'
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @todo.destroy
    flash[:success] = '予定を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def todo_params
    params.require(:todo).permit(:title, :content)
  end
  
  def correct_user
    @todo = current_user.todos.find_by(id: params[:id])
  unless @todo
    redirect_to root_url
  end
  end
end
