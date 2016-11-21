class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :authenticate_user!

  def index
    # TODO: add pagination of some sort
    @products = Product.all
    @product = Product.new
  end

  def show
    @reviews = @product.reviews
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name: params[:name], description: params[:description])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { render json: @product.to_json }
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
    params.require(:product).permit(:name, :description)
  end
end
