class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :success, :info, :warning, :danger
  before_action :set_search_menu, only: %i[index show new edit search]

  def correct_user
    return redirect_to login_url, danger: '権限がありません' unless logged_in?

    unless current_user.admin? || current_user?(@user)
      redirect_to user_url(current_user),
                  danger: '権限がありません'
    end
  end

  def correct_shop
    return redirect_to login_url, danger: '権限がありません' unless logged_in?

    unless current_user.admin? || current_users_shop?(@shop)
      redirect_to user_url(current_user),
                  danger: '権限がありません'
    end
  end

  def correct_menu
    return redirect_to login_url, danger: '権限がありません' unless logged_in?

    unless current_user.admin? || current_users_shop_menu?(@menu)
      redirect_to user_url(current_user),
                  danger: '権限がありません'
    end
  end

  # 住所入力関連
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[
                                        email
                                        name
                                        postcode
                                        prefecture_name
                                        address_city
                                        address_street
                                        address_building
                                      ])
  end

  private

  def set_search_menu
    @search_menu = Menu.ransack(params[:q])
  end
end
