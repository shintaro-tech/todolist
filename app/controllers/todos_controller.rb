class TodosController < ApplicationController
  def create
    @todo = todo.build(todo_params)
    if @todo.save
      flash[:success] = '新しい予定を作成しました'
      redirect_to root_url
    else
      @mtodos = todos.order(id: :desc).page(params[:page])
      flash.now[:danger] = '予定の作成に失敗しました。'
      render user_path
    end
  end

  def destroy
    @todo.destroy
    flash[:success] = '予定を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def todo_params
    params.require(:todo).permit(:title, :content, :tag)
  end
end
