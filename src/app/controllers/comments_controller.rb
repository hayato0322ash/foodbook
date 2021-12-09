class CommentsController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    comment = Comment.new comment_params
    if comment.save
      redirect_to menu_url(@menu)
    else
      flash.now[:alert] = 'コメントを入力してください'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: 2, menu_id: params[:menu_id])
  end
end
