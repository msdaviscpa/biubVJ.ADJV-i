class UsersController < ApplicationController

  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
 def index
   @users = User.find(params[:id])
   
 end
 
  def show
    @user = User.find(params[:id])
    debugger
  end
  
  private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password,
                                   :password_confirmation)
    end
  
end
