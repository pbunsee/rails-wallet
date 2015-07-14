class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    redirect_to new_session_path unless current_user
    @users = User.all
  end

  def create
    @user = User.create user_params
    if @user.valid?
      flash[:notice] = "Thanks for signing up"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "There was a problem."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname,
                                 :lname,
                                 :password,
                                 :email,
                                 :phone,
                                 :password_confirmation)
  end
end
