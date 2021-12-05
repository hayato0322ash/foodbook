class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    return redirect_to user_url(@user), success: "ユーザー「#{@user.name}」を登録しました" if @user.save

    render :new
  end

  def edit; end

  def update
    return redirect_to user_url(@user), success: "ユーザー「#{@user.name}」を更新しました" if @user.update user_params

    render :edit
  end

  def destroy
    @user.destroy
    redirect_to root_url, success: "ユーザー「#{@user.name}」を削除しました"
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
