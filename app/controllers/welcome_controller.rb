class WelcomeController < ApplicationController
  def index
    @articles = Article.where(visible: true).order(date: :desc)
  end

  def showReading
    @article = Article.find(params[:id])

    @related_articles = Article.where("id <> #{@article.id}").where(:visible => true).limit(3)
    
  end
end
