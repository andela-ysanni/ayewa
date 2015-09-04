class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
       format.html { redirect_to @user, notice: 'signed up successfully'}
     end
     else
       respond_to do |format|
        format.html { render 'new' }
      end
     end
  end

  def new
    @user = User.new
  end
  
  def show
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
