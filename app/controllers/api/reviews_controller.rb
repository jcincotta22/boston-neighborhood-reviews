class Api::ReviewsController < ApiController

  def show
    @review = Review.find(params[:id])
    @microhood = Microhood.find(params[:microhood_id])
    @review.microhood = @microhood
    vote = Vote.where(user_id: current_user.id).where(review_id: @review.id)[0]
    if !vote.nil?
      if params[:value] == "up"
        if vote.value == 1
          vote.value = 0
          vote.save
          button_class = ''
        else
          vote.value = 1
          vote.save
          error = ''
          button_class = 'green'
        end
      else
        if vote.value == -1
          vote.value = 0
          vote.save
          button_class = ''
        else
          vote.value = -1
          vote.save
          error = ''
          button_class = 'red'
        end
      end
    else
      if params[:value] == "up"
        Vote.create(value: 1, user_id: current_user.id, review_id: @review.id)
        error = ''
        button_class = 'green'
      else
        Vote.create(value: -1, user_id: current_user.id, review_id: @review.id)
        error = ''
        button_class = 'red'
      end
    end
    @review.update_attribute(:total_vote_count, calculate_votes)
    render json: { error: error, id: @review.id, class: button_class, vote_count: @review.total_vote_count}
  end

  def calculate_votes
    count = 0
    votes = Vote.where(review_id: params[:id])
    votes.each do |vote|
      count += vote.value
    end
    count
  end
end
