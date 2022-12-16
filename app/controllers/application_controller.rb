class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

# ログイン後の移動先を変更
  def after_sign_in_path_for(resource)
# ユーザー詳細画面へ移動したい
   flash[:notice] = "Signed in successfully."
   user_path(resource)
  end

  # ログアウト後
  def after_sign_out_path_for(resource)
  # トップ画面へ
    flash[:notice] ="Signed out successfully."
    root_path
  end


  protected

# deviseでも名前を保存できるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :email])
  end
end
