class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @nickname= @user.nickname
    @posts = @user.posts
  end

  def edit
  end

  def update
    # binding.pry
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:image, :email, :nickname, :introduction, :favorite_spot)
  end

  def set_user
    @user=User.find(params[:id])
  end
end
