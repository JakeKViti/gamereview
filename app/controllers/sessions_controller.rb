class SessionsController < ApplicationController
    def new
        @user = User.new
    end
  
    def create
        @user = User.find_by(name: params[:name])
        if @user&& @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:name] = params[:name]
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def acreate
        user = User.find_or_create_by(name: request.env['name'], email: request.env['email']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = 'asdfasdfasfsdafasdfasfgdafghertghiergoewrhngoerifgbhowpfbhnaewfiphbew'
          end
          user.save
          session[:user_id] = user.id
          redirect_to user_path(user)
    end

   

  
    def destroy
      session.delete :name
      session.delete :user_id
      render 'new'
    end
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

