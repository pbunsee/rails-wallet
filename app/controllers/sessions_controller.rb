class SessionsController < ApplicationController

  def new
    session[:user_id] = nil
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        flash[:welcome] = "Invalid Credentials"
        redirect_to users_path
      end
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end

end
