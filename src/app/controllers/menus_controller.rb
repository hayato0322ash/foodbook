class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]
  before_action :correct_menu, only: %i[edit update destroy]
  def index
    @menus = Menu.page(params[:page]).per(9)
  end

  def show
    @users = User.all
    @comment = Comment.new
    @reply = Reply.new
    @likes = Like.where(menu_id: params[:id])
    @favorites = Favorite.where(menu_id: params[:id])
  end

  def new
    @menu = Menu.new
    @shops = current_user.shops
  end

  def create
    @menu = Menu.new menu_params
    return redirect_to menu_url(@menu), success: "メニュー「#{@menu.name}」を作成しました" if @menu.save

    render :new
  end

  def edit; end

  def update
    return redirect_to menu_url(@menu), success: "メニュー「#{@menu.name}」を編集しました" if @menu.update menu_params

    render :edit
  end

  def destroy
    @menu.destroy
    redirect_to menus_url, danger: "メニュー「#{@menu.name}」を削除しました"
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price, :evaluation, :shop_id, :image, :category_id)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
