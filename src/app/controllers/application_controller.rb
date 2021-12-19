class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :success, :info, :warning, :danger

  def correct_user
    return redirect_to login_url, danger: '権限がありません' unless logged_in?

    unless current_user.admin? || current_user?(@user)
      @user = User.find(params[:id])
      redirect_to user_url(current_user), danger: '権限がありません'
    end
  end
end
