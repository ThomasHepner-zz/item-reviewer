class ReviewsController < ApplicationController
  before_action :set_product, only: [:create, :new, :index]
  def index
    @reviews = @product.reviews
  end

  def new
    @review = Review.new
  end

  def create
    # TODO: test
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = 'Successfully added review.'
      redirect_to @product
    else
      render 'new'
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
