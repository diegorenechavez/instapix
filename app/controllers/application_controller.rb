class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token



    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end


    def login(user_instance)
        session[:session_token] = user_instance.reset_session_token!
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil 
        @current_user = nil
    end 

    def logged_in?
        !!current_user
    end 

end
