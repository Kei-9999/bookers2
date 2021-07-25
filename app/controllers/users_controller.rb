class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    @book = Book.new
    @image = @profile_image_id
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end

  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new


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

