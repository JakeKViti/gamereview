class ApplicationController < ActionController::Base
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        if !current_user
            flash[:error] = "You must be logged in to access this section"
            redirect_to root_path # halts request cycle
        end
    end

    
      
end

