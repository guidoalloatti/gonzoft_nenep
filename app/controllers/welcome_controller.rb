class WelcomeController < ApplicationController
  def index
    @articles = Article.where(visible: true).order(date: :desc)
    @products = Product.where(visible: true).order(startDate: :desc)
  end

  def showReading
    @article = Article.find(params[:id])

    @related_articles = Article.where("id <> #{@article.id}").where(:visible => true).limit(3)
    
  end

  def showReadingList
    @classes = ['first', 'second', 'third']
    @articles = Article.where(visible: true).order(date: :desc)
  end

  def showPackages
    @header = params[:type] == '1' ?   "Cruceros" : "Paquetes"
    @packages = Product.where(:productType => params[:type]).where(:visible => true)
  end
end
