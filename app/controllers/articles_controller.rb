class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = t("article.create.success")
      redirect_to @article
    else
      flash[:error] = t("article.create.error")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = t("article.update.success")
      redirect_to @article
    else
      flash.now[:error] = t("article.update.error")
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = t("article.destroy.success")
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:ar_title, :en_title, :author, :content,
                                    :active)
  end
end
