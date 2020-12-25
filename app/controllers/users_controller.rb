class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        flash[:alert] = nil
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to login_path
        else
            @errors = @user.errors.full_messages
            flash[:alert] = "Account was unable to be made!"
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        @reviews = User.find_by(id: params[:id]).reviews
    end

    def homepage
     
    end

    private
    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password
        )
    end
end