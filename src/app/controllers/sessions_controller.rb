class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if @user
      @current_user = @user
      session[:user_id] = @current_user.id
      flash[:success] = "#{@current_user.name}でログインしました"
      redirect_to user_url(@current_user)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
    flash[:success] = 'ログアウトしました'
  end
end
