
# We should create user models, but for now

class User
  attr_accessor :id, :name
end

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @users = []
    ['Gonzo', 'Juan', 'Pedro'].each.with_index do |value, index|
      tempUser = User.new
      tempUser.id = index
      tempUser.name = value
      @users.push(tempUser)
    end
    @articles = Article.all.order(date: :desc)

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  def updateVisibility
    @article = Article.find(params[:id])
    @article.visible = !@article.visible
    respond_to do |format|
      if @article.save 
        format.html { redirect_to @article, notice: 'El articulo sera mostrado en la pagina principal.' }
      else
        format.html { render action: 'index' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
    @users = []
    ['Gonzo', 'Juan', 'Pedro'].each.with_index do |value, index|
      tempUser = User.new
      tempUser.id = index
      tempUser.name = value
      @users.push(tempUser)
    end
    
  end

  # GET /articles/1/edit
  def edit
    @users = []
    ['Gonzo', 'Juan', 'Pedro'].each.with_index do |value, index|
      tempUser = User.new
      tempUser.id = index
      tempUser.name = value
      @users.push(tempUser)
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :detail, :visible, :date, :author, :photo)
    end
end
