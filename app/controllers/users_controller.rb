class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @nickname = @user.nickname

    # @postsに自分の投稿を入れている
    @posts = @user.posts

    # ここでの@postsは上記の@postsに代入された自分の投稿だけを照準で表示させることを代入している。
    @posts = @posts.includes(:user).order('created_at DESC').page(params[:page]).per(6)
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
    params.require(:user).permit(:image, :email, :nickname, :introduction, :tag_list)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
