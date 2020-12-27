module GamesHelper
    def admin_perms_new_game
        if session[:name] == "Admin"
            return link_to 'Games New', new_game_path 
        end
    end

    def admin_perms_edit_game
        if session[:name] == "Admin"
            return link_to 'Games Edit', [:edit, @games] 
        end
    end
end
