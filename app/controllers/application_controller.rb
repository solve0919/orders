class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :user_signed_in?
  before_action :authenticate_user! , except: [:top]
  before_action :registration_user

  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/contractors"
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end 
  
  def registration_user
    @order = current_user.order
    unless @order
      flash[:notice] = "発注者登録をお願いします。"
      redirect_to("/orders/new")
    end
  end

  
end
