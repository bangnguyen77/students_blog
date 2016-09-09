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

  private
  def article_params
    params.require(:article).permit(:title, :author, :points)
  end
end
