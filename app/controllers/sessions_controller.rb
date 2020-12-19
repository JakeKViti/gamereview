class SessionsController < ApplicationController
    def new
        @user = User.new
    end
  
    def create
        @user = User.find_by(name: params[:name])
        if @user&& @user.authenticate(params[:password])
            session[:name] = params[:name]
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
  
    def destroy
      session.delete :name
      render 'new'
    end
  end