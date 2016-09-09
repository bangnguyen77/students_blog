class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('points DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article successfully added!"
      redirect_to articles_path
    else
      flash[:alert] = "Article not saved. Try again!"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Update saved successfully!"
      redirect_to articles_path
    else
      flash[:alert] = "Update not saved. Try again!"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was deleted successfully!"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :author, :points)
  end
end
