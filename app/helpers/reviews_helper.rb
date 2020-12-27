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
    

end
