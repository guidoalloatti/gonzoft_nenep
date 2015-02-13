class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  respond_to :html, :xml, :json  

  def index
    @products = Product.where(productType: params[:productType])
    if @products.nil?
      @products = Product.none
    end
    @productType = params[:productType]
    @modelName = params[:productType] == "1" ? "Crucero" : "Paquete"
    respond_with(@products)
  end

  def show
    respond_to do |format|
    format.json {
     render :json => @product.to_json(:methods => [:main_image])
    }
    format.html { respond_with(@product) }
  end
    
  end

  def new
    @product = Product.new
    @users = User.all
    if params[:productType]
      @product.productType = params[:productType]
    end
    puts @product.productType
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to '/products/list/#{@product.productType}' }
      format.json { head :no_content }
    end
  end


  def updateVisibility
    @product = Product.find(params[:id])
    @product.visible = !@product.visible
    respond_to do |format|
      if @product.save 
        format.html { redirect_to @product, notice: 'El Producto sera mostrado en la pagina principal.' }
      else
        format.html { render action: 'index' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :startDate, :endDate, :nights, :visible, :boatName, :boatLink, :cruise_image, :itinerary, :itinerary_image, :productType, :user_id, :hotelName, :hotelLink, :hotel_image, :excursions, :flightName, :flightFrom, :flightTo, :video_Link, :main_image)
    end
end
