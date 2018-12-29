class UsersController < ApplicationController
  
  def index
   @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      # Handle a successful save.
      flash[:success] = "Enrollment Successful"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])    
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Update Successful"
      redirect_to @user
    else
      render 'edit'
    end
  end
 

  
  private

    def user_params
      params.require(:user).permit( :name, :email, :password,
                                   :password_confirmation)
    end
  
end
