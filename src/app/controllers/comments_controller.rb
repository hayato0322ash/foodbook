class CommentsController < ApplicationController
  before_action :set_menu, only: %i[create destroy]
  def create
    comment = Comment.new comment_params
    if comment.save
      redirect_to menu_url(@menu), success: 'コメントを投稿しました'
    else
      redirect_to menu_url(@menu), danger: 'コメントを入力してください'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to menu_url(@menu), danger: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: session[:user_id], menu_id: params[:menu_id])
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
end
