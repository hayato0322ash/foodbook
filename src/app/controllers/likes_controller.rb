class LikesController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    @like = Like.new(menu_id: params[:menu_id], user_id: current_user.id)
    @like.save
    redirect_to @menu
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @like = Like.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    @like.destroy
    redirect_to @menu
  end
end
