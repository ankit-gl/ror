class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    def require_user_logged_in!
      redirect_to login_path, alert: 'You must be signed in' if Current.user.nil?
    end

    def require_user_logged_out!
      redirect_to home_path if !Current.user.nil?
    end

    def is_user_logged_in
      !Current.user.nil?
    end
end
