class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]
  def index
    @menus = Menu.all
  end

  def show
    @users = User.all
    @comment = Comment.new
    @reply = Reply.new
  end

  def new
    @menu = Menu.new
  end

  def create
    # ログイン機能の実装までの仮
    @shop = Shop.find(1)
    @menu = @shop.menus.new menu_params
    # @menu = Menu.new(name: params[:name], price: params[:price], evaluation: 3, shop_id: 1)
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
    redirect_to root_url, success: "メニュー「#{@menu.name}」を削除しました"
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price, :evaluation)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
