class ReviewsController < ApplicationController
  before_action :require_login
  before_action :find_review
  before_action :admin?

    def index
        @reviews = Review.all.latest
        @cu = current_user
      end
    
      def show
      end
    
      def new
        @review = Review.new
        @cu = current_user
        @review.build_game
        flash[:alert] = nil
      end
    
      def create
        @review = Review.new(review_params)
        @review.user = current_user
        if @review.save
        redirect_to review_path(@review), warning: "Review was Created!"
        else
          @errors = @review.errors.full_messages
          flash[:alert] = "Review was unable to be made!"
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
        redirect_to review_path(@review), warning: "Review was saved!"
        else
          @errors = @review.errors.full_messages
          flash[:alert] = "Review was unable to be made!"
          render :edit
        end
      end

    def destroy
      Review.find(params[:id]).destroy
      redirect_to reviews_path, warning: "Review was deleted!"
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
