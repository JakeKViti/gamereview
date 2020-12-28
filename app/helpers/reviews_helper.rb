module ReviewsHelper
    def new_or_update?
        if params[:game_id] != nil
            return params[:game_id]
        elsif @review.game_id != nil
            return @review.game_id
        end
    end

    def new_game?
        if new_or_update? == nil
           return true
        end
    end
    
    def review_edit_owner?
        if @review.user_id == session[:user_id]
            return link_to 'Review Edit', [:edit, @review] 
        end
    end

    def review_delete_owner?
        if @review.user_id == session[:user_id]
            return button_to "Delete", @review, method: :delete 
        end
    end
end
