class ReviewsController < ApplicationController
    def index
        @reviews = Review.all.latest
        @cu = current_user
      end
    
      def show
        @review = Review.find_by(id: params[:id])
      end
    
      def new
        @review = Review.new
        @cu = current_user
        @review.build_game
      end
    
      def create
        @review = Review.new(review_params)
        @review.user = current_user
        if @review.save
        redirect_to review_path(@review)
        else
          render :new
        end
      end
    
      def edit
        @review = Review.find_by(id: params[:id])
        @games = Game.all
      end
    
      def update
        @review = Review.find_by(id: params[:id])
        @review.user = current_user
        @review.update(review_params)
        if @review.save
        redirect_to review_path(@review)
        else
          render :edit
        end
      end

    def destroy
      Review.find(params[:id]).destroy
      redirect_to reviews_path
     end
    
      private
        def review_params
          params.require(:review).permit(
            :title,
            :body,
            :rating,
            :user_id,
            :game_id,
            game_attributes:[:title, :genre, :developer, :age]
           )
    end
end
