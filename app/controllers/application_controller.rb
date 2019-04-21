class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/"
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end 
end
