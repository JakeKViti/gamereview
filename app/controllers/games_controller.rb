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
        flash[:alert] = nil
      end
    
      def create
        @games = Game.create(game_params)
        if @games.save
        redirect_to game_path(@games)
        else
          @errortitle = @games.errors[:title]
          @errorgenre = @games.errors[:genre]
          @errordev = @games.errors[:developer]
          @errorage = @games.errors[:age]
          flash[:alert] = "Game was unable to be made!"
          render :new
        end
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
