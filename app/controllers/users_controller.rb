class UsersController < ApplicationController
  before_action :correct_user, only:[:edit, :update]

  def index
    @user = current_user
  	@users = User.all
    @book = Book.new
  end

  def show
  	 @user = User.find(params[:id])
     @book = Book.new
     @books = Book.where(user_id:params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params)
  if @user.save
     redirect_to user_path(@user.id), notice: 'You have updated user successfully'
  else
    flash.now[:notice] = 'update error'
    render action: :edit
  end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
  if current_user.id != @user.id
    redirect_to user_path(current_user)
  end
 end
end
