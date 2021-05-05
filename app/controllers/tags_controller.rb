class TagsController < ApplicationController
  before_action :require_user_logged_in
#  before_action :correct_user, only: [:edit,:show, :update, :destroy]
  before_action :correct_tag, only: [:edit,:show, :update, :destroy]
  
  def index
    #これはNG: @tags = Tag.order(id: :desc).page(params[:page]).per(10)
    # ユーザ自身が登録したタグの一覧を取得する
    @tags = current_user.tags.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = current_user.tags.build(tag_params)
    if @tag.save
      flash[:success] = '新しいカテゴリを作成しました'
      redirect_to tags_path
    else
      flash.now[:danger] = 'カテゴリの作成に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to tags_path
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tag.destroy
    flash[:success] = '予定を削除しました。'
    redirect_to tags_path
  end
  
   private

  def tag_params
    params.require(:tag).permit(:title)
  end
  
#  def correct_user
  def correct_tag
    #これはNG: @tag = Tag.find(params[:id])
    @tag = current_user.tags.find_by(id: params[:id])
    unless @tag
      redirect_to root_url
    end
  end
end
