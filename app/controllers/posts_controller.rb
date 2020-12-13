class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
    if params[:tag_name]
      @posts = Post.tagged_with(params[:tag_name])
    #   # .page(params[:page])
    end
    @tags = Post.tag_counts_on(:tags)
    # @tag_lists = Tag.all
  end

  def new
    @post = Post.new
    # @post.build_map
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # ここで言う(params[:id])はindex.html.rbのpost_path(post.id)（詳細画面表示パスと投稿id）＝投稿したparams.idのことをさす。
    # post.idが「３」ならparams[:id]=>3、つまりpostテーブルidが3のものに対し処理を行う。
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @post_tags = @post.tags 
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def search
    @posts = Post.search(params[:keyword]).order('created_at DESC')
  end

  # def tags
  #   @tags = Post.includes(:taggings).tag_counts_on(:tags)
  # end

  # def get_tag_search
  #   @tags = Post.tag_counts_on(:tags).where('name LIKE(?)', "%#{params[:key]}%")
  # end

  private

  def post_params
    params.require(:post).permit(:image, :name, :url, :impressions, :prefecture_id, :address, :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
