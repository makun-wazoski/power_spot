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
end
