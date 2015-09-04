class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user =  User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        redirect_to root_url, notice: "signed in"
      else
        flash[:error] = "You account has not been verified"
        render "new"
      end    
    else
      flash[:error] = "Wrong email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
