class UsersController < ApplicationController
    layout false, :except => :show
    before_action :require_login, only: [:show]
    before_action :find_user

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to login_path
        else
            render 'new'
        end
    end

    def show
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