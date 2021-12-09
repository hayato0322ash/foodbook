class RepliesController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.new reply_params
    if @reply.save
      redirect_to menu_url(@menu)
    else
      flash.now[:alert] = 'リプライができませんでした'
      redirect_to root_url
    end
  end

  private

  def reply_params
    params.permit(:content).merge(user_id: 1,
                                  menu_id: params[:menu_id],
                                  comment_id: params[:comment_id])
  end
end
