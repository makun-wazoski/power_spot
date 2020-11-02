class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @nickname= @user.nickname
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    # binding.pry
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:image, :email, :nickname, :introduction, :favorite_spot)
  end
end
