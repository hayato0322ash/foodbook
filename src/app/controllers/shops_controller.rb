class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]
  def index
    @shops = Shop.all
  end

  def show; end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new shop_params
    return redirect_to shop_url(@shop), success: "店舗「#{@shop.name}」を登録しました" if @shop.save

    render :new
  end

  def edit; end

  def update
    return redirect_to shop_url(@shop), success: "店舗「#{@shop.name}」の情報を更新しました" if @shop.update shop_params

    render :edit
  end

  def destroy
    @shop.destroy
    redirect_to shops_url, success: "店舗「#{@shop.name}」を削除しました"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :business_hour, :address)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
