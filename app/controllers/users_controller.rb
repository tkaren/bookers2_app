class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @book = Book.new
 end

 def edit
  @user = User.find(params[:id])
 end
 
 def update
  @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
 end

 def index
  @users = User.all
  @user = current_user
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
