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
        redirect_to games_path, info: "Only the admin may enter this page!" unless current_user.name == "Admin"
    end

    def owner?
        redirect_to reviews_path, info: "Only the owner may enter this page!" unless current_user.id == @review.user_id
    end

    def existing_game
        if params[:review][:game_id] == nil   
            @review.game = Game.find_by(title: params[:review][:game_attributes][:title], developer: params[:review][:game_attributes][:developer], year_released: params[:review][:game_attributes][:year_released])
        end
    end
      
end

