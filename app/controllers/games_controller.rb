class GamesController < ApplicationController
  before_action :require_login
  before_action :find_game
  before_action :admin?, only: [:new, :edit]

    def index
        @games = Game.alphabetized
      end
    
      def show
      end
    
      def new
        @games = Game.new
      end
    
      def create
        @games = Game.create(game_params)
        if @games.save
        redirect_to game_path(@games), info: "Game was Created!"
        else
          render :new
        end
      end
    
      def edit

      end
    
      def update
        @games.update(game_params)
        if @games.save
        redirect_to game_path(@games), info: "Game was Updated!"
      else
        render :edit
      end
    end

      private
        def game_params
          params.require(:game).permit(
            :title,
            :genre,
            :developer,
            :age,
            :year_released
         )
    end
end
