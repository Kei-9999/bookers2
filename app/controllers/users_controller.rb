class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

     if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully'
      redirect_to user_path(@user.id)
     else

      render action: :edit
     end
  end



 private
 def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
 end
end

