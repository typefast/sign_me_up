class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Thank You, We will keep you updated!"
      redirect_to '/'
    else
      flash[:error] = "There was an error, make sure a name and valid email have been entered."
      redirect_to '/'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
