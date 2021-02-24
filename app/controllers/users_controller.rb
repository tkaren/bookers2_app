class UsersController < ApplicationController

 def index
  @users = User.all
  @user = current_user
 end

 def show
  @user = User.find(params[:id])
 end

 def edit
  @user = User.find(params[:id])
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
