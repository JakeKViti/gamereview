class GamesController < ApplicationController
  before_action :require_login
  before_action :find_game

    def index
        @games = Game.all.alphabetized
        @cu = current_user
      end
    
      def show
      end
    
      def new
        @games = Game.new
        flash[:alert] = nil
      end
    
      def create
        @games = Game.create(game_params)
        if @games.save
        redirect_to game_path(@games)
        else
          @errors = @games.errors.full_messages
          flash[:alert] = "Game was unable to be made!"
          render :new
        end
      end
    
      def edit
      end
    
      def update
        @game.update(game_params)
        if @games.save
        redirect_to game_path(@games)
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
