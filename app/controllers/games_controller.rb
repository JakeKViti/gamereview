class GamesController < ApplicationController
    def index
        @games = Game.all
      end
    
      def show
        @game = Game.find_by(id: params[:id])
      end
    
      def new
        @game = Game.new
      end
    
      def create
        game = Game.create(game_params)
        redirect_to game_path(game)
      end
    
      def edit
        @game = Game.find_by(id: params[:id])
      end
    
      def update
        game = Game.find_by(id: params[:id])
        game.update(game_params)
        redirect_to game_path(game)
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
