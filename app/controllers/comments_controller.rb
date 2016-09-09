class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to article_path(@comment.article)
    else
      flash[:alert] = "Comment not saved. Try again!"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Update saved successfully!"
      redirect_to article_path(@comment.article)
    else
      flash[:alert] = "Update not saved. Try again!"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was deleted successfully!"
    redirect_to article_path(@comment.article)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user, :article_id, :points)
  end
end
