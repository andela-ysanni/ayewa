class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_user, :only => [:edit, :show, :update]
 def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_verification(@user).deliver_now
      respond_to do |format|
       format.html { redirect_to new_session_path, notice: 'Signed up successfully, a confirmation email has been sent to your emaill account'}
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

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_mail
      user = User.find_by_confirm_token(params[:id])
      if user
        user.email_activate
        flash[:success] = "Welcome to the AYEWA Your email has been confirmed."
        session[:user_id] = user.id
        redirect_to user
      else
        flash[:error] = "Sorry. User does not exist"
        redirect_to root_url
      end
  end

  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :status, :avatar, :email, :password, :confirm_token)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
