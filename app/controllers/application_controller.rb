class ApplicationController < ActionController::Base
    add_flash_types :info
    helper_method :current_user
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        if !session[:user_id]
            redirect_to root_path, info: "You must be logged in!" 
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

    def owner?
        current_user.id == @review.user_id
    end

    def clear_errors
        @errors = []
    end
      
end

