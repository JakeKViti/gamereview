class GamesController < ApplicationController
    def index
        @games = Game.all.alphabetized
        @cu = current_user
      end
    
      def show
        @games = Game.find_by(id: params[:id])
      end
    
      def new
        @games = Game.new
      end
    
      def create
        @games = Game.create(game_params)
        
        redirect_to game_path(@games)
      end
    
      def edit
        @games = Game.find_by(id: params[:id])
      end
    
      def update
        @games = Game.find_by(id: params[:id])
        game.update(game_params)
        redirect_to game_path(@games)
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
