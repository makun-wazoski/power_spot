class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def new
  #   @user = User.new
  # end

  def show
    @nickname = @user.nickname
    @posts = Post.includes(:user).order('created_at DESC')
    # @posts = @user.posts
  end

  def edit
  end

  def update
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
    # binding.pry
    params.require(:user).permit(:image, :email, :nickname, :introduction, :favorite_spot)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
