class UsersController < ApplicationController
  before_action :require_not_logged_in, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    permited_params = params.require(:user).permit(:name, :username)
    permited_params[:username].downcase!
    permited_params
  end

  def require_not_logged_in
    if signed_in?
      flash[:error] = "Already logged in"
      redirect_to user_path(current_user.id)
    end
  end
end
