class Api::ReviewsController < ApiController

def show
  @review = Review.find(params[:id])
  @microhood = Microhood.find(params[:microhood_id])
  @review.microhood = @microhood
end
