class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @microhood = Microhood.find(params[:id])
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @microhood = Microhood.find(params[:microhood_id])
    @neighborhood = Neighborhood.find(@microhood.neighborhood_id)
    @review.microhood = @microhood
    @review.user_id = @user.id
    invalid_entry
    if @review.save
      flash[:notice] = 'Review added successfully!'
      redirect_to microhood_path(@microhood)
    else
      @errors = @review.errors.full_messages.join(', ')
      flash[:notice] = @errors
      redirect_to microhood_path(@microhood)
    end
  end

  private

  def invalid_entry
    if @review.schools_rating || @review.public_transport || @review.food_entertainment || @review.safety_rating
      @review.rating = overall_rating(@review.schools_rating, @review.public_transport, @review.food_entertainment, @review.safety_rating)
    end
  end

  def overall_rating(schools, trans, food, safety)
    sum = schools + trans + safety + food
    average = sum / 4.0
    average.round(1)
  end

  def review_params
    params.require(:review).permit(:safety_rating, :schools_rating, :food_entertainment, :public_transport, :title, :body)
  end
end
