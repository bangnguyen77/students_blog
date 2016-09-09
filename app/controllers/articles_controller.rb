class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render :index
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :author, :points)
  end
end
