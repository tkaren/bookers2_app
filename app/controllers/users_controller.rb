class UsersController < ApplicationController
  
 def index
  @uesrs = User.all
 end
 
 def show
  @user = User.find(current_user.id)
 end
 
 def edit
 end
 
 private
 
 def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
 end
 
 def correct_user
  @user = User.find(params[:id])
   unless @user == current_user
    redirect_to user_path(current_user)
   end
 end
 
end
