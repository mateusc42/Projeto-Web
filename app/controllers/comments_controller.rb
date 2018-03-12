class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_parent

  def new
    @comment = @parent.comments.new
  end
 
  def create
    @comment = @parent.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render action: 'new'
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:comment_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Successfully updated comment."
      redirect_to post_path(@comment.post)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.with_deleted.find(params[:id])
    if params[:type] == 'normal'
      @comment.destroy
    elsif params[:type] == 'forever'
      @comment.really_destroy!
    elsif params[:type] == 'undelete'
      @comment.restore(:recursive => true)
    end
    flash[:notice] = "Successfully destroyed comment."
    redirect_to post_path(@comment.post)
  end
 
  private
   
    def get_parent
      @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
      @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
       
      redirect_to root_path unless defined?(@parent)
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end