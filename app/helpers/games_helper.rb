module GamesHelper
    def admin_perms_new_game
        if session[:name] == "Admin"
            return link_to 'Admin, Create A Game Here', new_game_path 
        end
    end

    def admin_perms_edit_game
        if session[:name] == "Admin"
            return link_to 'Admin, Edit This Game Here', [:edit, @games] 
        end
    end
end
