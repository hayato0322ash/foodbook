class RepliesController < ApplicationController
  before_action :set_menu_comment, only: %i[create destroy]
  def create
    @reply = Reply.new reply_params
    if @reply.save
      redirect_to menu_url(@comment.menu)
    else
      flash.now[:alert] = 'リプライができませんでした'
      redirect_to root_url
    end
  end

  def destroy
    Reply.find(params[:id]).destroy
    redirect_to menu_url(@comment.menu), success: 'リプライを削除しました'
  end

  private

  def reply_params
    params.permit(:content).merge(user_id: session[:user_id],
                                  comment_id: params[:comment_id])
  end

  def set_menu_comment
    @comment = Comment.find(params[:comment_id])
  end
end
