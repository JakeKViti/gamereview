class SessionsController < ApplicationController

    def new
        @user = User.new
    end
  
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            session[:name] = params[:user][:name]
            redirect_to user_path(@user), info: "Welcome!"
        else
          flash[:alert] = "Username or Password is incorrect!"
          render 'new'
        end
    end

    def acreate
        @user = User.find_or_create_by(name: auth['info']['name'], email: auth['info']['email']) do |u|  
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = 'asdfasdfasfsdafasdfasfgdafghertghiergoewrhngoerifgbhowpfbhnaewfiphbew'
          end
          session[:user_id] = @user.id
          session[:name] = @user.name
          @user.save
          redirect_to user_path(@user), info: "Welcome!"
    end

    def destroy
      session.delete :name
      session.delete :user_id
      redirect_to root_path, info: "Goodbye!"
    end
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

