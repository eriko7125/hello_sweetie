class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when AdminUser
      admin_orders_path
    when EndUser
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin_user
      new_admin_user_session_path
    else
      root_path
    end
  end

  # Bootstrap用フラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger
end
