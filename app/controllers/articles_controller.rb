class ArticlesController < ApplicationController
  include ArticlesHelper
  
  before_filter :require_login, except: [:index, :show]
  before_filter :prepare_authors

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    
    @comment = Comment.new
    @comment.article_id = @article.id
    
    @author = Author.find(@article.author_id)

  end

  def new
    @article = Article.new
    @article.author_id = current_user.id
  end
  
  def create
  	@article = Article.new(article_params)
  	@article.save
  	
  	redirect_to article_path(@article)
  end
  
  def destroy
  	Article.destroy(params[:id])
  	
  	flash.notice = "Article '#{params[:id]}' removed!"	
  	
  	redirect_to action: 'index'
  end
  
  def edit
    @article = Article.find(params[:id])
    @author = Author.find(@article.author_id)
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    flash.notice = "Article '#{@article.title}' updated!"
    
    redirect_to article_path(@article)
  end
  
  def prepare_authors
    @authors = Author.all
  end

end
