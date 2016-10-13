class Api::ReviewsController < ApiController
  include VoteHelper
  def show
    @review = Review.find(params[:id])
    @microhood = Microhood.find(params[:microhood_id])
    @review.microhood = @microhood
    vote = Vote.where(user_id: current_user.id).where(review_id: @review.id)[0]
    button_class = ''
    if !vote.nil?
      button_class = update_vote(vote, params[:value])
    else
      button_class = create_vote(params[:value], @review)
    end
    @review.update_attribute(:total_vote_count, calculate_votes(@review))
    render json: { id: @review.id, class: button_class, vote_count: @review.total_vote_count}
  end
end
