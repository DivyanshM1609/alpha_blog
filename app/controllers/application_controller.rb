class ApplicationController < ActionController::Base
  
    def home
        render 'home' 
    end
    # helper_method :current_user, :logged_in?
    # def current_user
    #     if session[:user_id]
    #         @current_user ||= User.find(session[:user_id])
    #     end
    # end

    # def logged_in?
    #     !!current_user
    # end

    def require_user
        if !user_signed_in?
            flash[:alert]="You must be logged in to perform this action"
            redirect_to login_path
        end
    end

end
