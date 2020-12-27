class GamesController < ApplicationController
  before_action :require_login
  before_action :find_game
  before_action :admin?

    def index
        @games = Game.all.alphabetized
        @cu = current_user
      end
    
      def show
      end
    
      def new
        if admin?
        @games = Game.new
        @errors = []
        else
          redirect_to games_path, warning: "Only the admin may enter this page!"
        end

      end
    
      def create
        @games = Game.create(game_params)
        if @games.save
        redirect_to game_path(@games), warning: "Game was Created!"
        else
          @errors = @games.errors.full_messages
          flash[:alert] = "Game was unable to be made!"
          render :new
        end
      end
    
      def edit
        if admin?
        @errors = []
        else
        redirect_to games_path, warning: "Only the admin may enter this page!"
        end
      end
    
      def update
        @games.update(game_params)
        if @games.save
        redirect_to game_path(@games), warning: "Game was Updated!"
      else
        @errors = @games.errors.full_messages
        flash[:alert] = "Game was unable to be made!"
        render :edit
      end
    end
    
      private
        def game_params
          params.require(:game).permit(
            :title,
            :genre,
            :developer,
            :age
         )
    end
end
