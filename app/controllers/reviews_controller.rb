class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
        @cu = current_user
      end
    
      def show
        @review = Review.find_by(id: params[:id])
      end
    
      def new
        @review = Review.new
      end
    
      def create
        review = Review.create(review_params)
        redirect_to review_path(review)
      end
    
      def edit
        @review = Review.find_by(id: params[:id])
      end
    
      def update
        review = Review.find_by(id: params[:id])
        review.update(review_params)
        redirect_to review_path(review)
      end
    
      private
        def review_params
          params.require(:review).permit(
            :title,
            :body,
            :rating
         )
    end
end
