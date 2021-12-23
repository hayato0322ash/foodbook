class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @likes = Like.where(user_id: params[:id])
    @user_shops = Shop.where(user_id: @user.id)
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    return redirect_to user_url(@user), success: '登録完了しました' if @user.save

    render :new
  end

  def edit; end

  def update
    return redirect_to user_url(@user), success: "ユーザー「#{@user.name}」を更新しました" if @user.update user_params

    render :edit
  end

  def destroy
    if admin? && current_user?(@user)
      session.delete(:user_id)
      @user.destroy
      redirect_to login_url, danger: "ユーザー「#{@user.name}」を削除しました"
    elsif admin?
      @user.destroy
      redirect_to users_url, danger: "ユーザー「#{@user.name}」を削除しました"
    else
      session.delete(:user_id)
      @user.destroy
      redirect_to root_url, danger: "ユーザー「#{@user.name}」を削除しました"
    end
  end

  private

  def user_params
    # dateについて調べる QQQ
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :sex, :birthday, :'date(1i)',
                                 :'date(2i)',
                                 :'date(3i)',
                                 :receiving_method,
                                 :receiving_store,
                                 :delivery_address,
                                 :payment,
                                 :voucher,
                                 :message)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
