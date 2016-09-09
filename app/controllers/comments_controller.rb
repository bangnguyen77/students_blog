class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user, :article_id)
  end
end
