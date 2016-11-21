class ReviewsController < ApplicationController
  before_action :set_product, only: [:create, :new, :index]
  def index
    @reviews = @product.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(content: params[:content], rating: params[:rating],
                         product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if @review.save
        format.html { redirect_to @product }
        format.json { render json: @product.to_json }
      else
        format.html { redirect_to @product }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
