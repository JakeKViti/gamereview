class ApplicationController < ActionController::Base
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        if !session[:user_id]
            @flash[:error] = "You must be logged in to access this section"
            redirect_to root_path # halts request cycle
        end
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def find_game
        @games = Game.find_by(id: params[:id])
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def admin?
        current_user.name == "Admin"
    end
      
end

