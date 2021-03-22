class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: params[:current_user_id])
    if @user
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome Back!"
      redirect_to root_path
    else
      flash.now[:error] = "Could not log in, please try again." 
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end
end
