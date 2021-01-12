class ReviewsController < ApplicationController
  before_action :require_login
  before_action :find_review
  before_action :owner?, only: [:edit, :destroy]
  before_action :existing_game, only: [:create]

    def index
        @reviews = Review.latest
      end
    
      def show
      end
    
      def new
        @review = Review.new
        @review.build_game
      end
    
      def create
        @review = Review.new(review_params)
        @review.user = current_user
        if @review.save
        redirect_to review_path(@review), info: "Review was Created!"
        else
          render :new
        end
      end
    
      def edit
        @games = Game.all
      end
    
      def update
        @review.user = current_user
        @review.update(review_params)
        if @review.save
        redirect_to review_path(@review), info: "Review was saved!"
        else
          render :edit
        end
      end

    def destroy
      Review.find(params[:id]).destroy
      redirect_to reviews_path, info: "Review was deleted!"
     end
    
      private
        def review_params
          params.require(:review).permit(
            :title,
            :body,
            :rating,
            :user_id,
            :game_id,
            game_attributes:[:title, :genre, :developer, :age, :year_released]
           )
    end
end
