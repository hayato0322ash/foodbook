class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @favorite = Favorite.new(menu_id: params[:menu_id], user_id: current_user.id)
    @favorite.save
    redirect_to @menu
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @favorite = Favorite.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to @menu
  end
end
