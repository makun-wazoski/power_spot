class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname= @user.nickname
    @posts = @user.posts
  end
end
