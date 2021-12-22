module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # カレントユーザーのセッティング
  def current_user
    if session[:user_id].present?
      user_id = session[:user_id]
      @current_user ||= User.find(user_id)
    end
  end

  # カレントユーザーである？
  def current_user?(user)
    user == current_user
  end

  # カレントユーザーの店である？
  def current_users_shop?(shop)
    shop.user_id == current_user.id
  end

  # カレントユーザーの店である？
  def current_users_shop_menu?(menu)
    menu.shop.user_id == current_user.id
  end

  # カレントユーザーが作ったもの？
  def current_user_item?(item)
    current_user.id == item.user.id if current_user
  end

  # ログイン中？
  def logged_in?
    !current_user.nil?
  end

  # 管理者権限あり？
  def admin?
    current_user.admin? if current_user
  end

  # ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
