class SessionsController < ApplicationController
    def new
        @user = User.new
        flash[:alert] = nil
    end
  
    def create
        @user = User.find_by(name: params[:name])
        if @user&& @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:name] = params[:name]
            redirect_to user_path(@user)
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
          binding.pry 
          @user.save
          redirect_to user_path(@user)
    end

    def destroy
      session.delete :name
      session.delete :user_id
      redirect_to root_path
    end
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

