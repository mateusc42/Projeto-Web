class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.order( created_at: :desc ).page(params[:page]).per_page(4)
    respond_to do |format|
      format.html
      format.csv { send_data @posts.to_csv }
      format.xls # { send_data @posts.to_csv(col_sep: "\t") }
    end
  end

  def myposts
    @posts = current_user.posts.order( created_at: :desc ).page(params[:page]).per_page(4)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.with_deleted.find(params[:id])
    if params[:type] == 'normal'
      @post.destroy
    elsif params[:type] == 'forever'
      @post.really_destroy!
    elsif params[:type] == 'undelete'
      @post.restore(:recursive => true)
    end
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Parâmetros do post
    def post_params
      params.require(:post).permit(:user_id, :title, :description, :content, :image)
    end
end