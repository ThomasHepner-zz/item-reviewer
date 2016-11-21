class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :authenticate_user!

  def index
    # TODO: add pagination of some sort
    @products = Product.all
  end

  def show
    @reviews = @product.reviews
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product successfully created.'
    else
      render 'new'
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
