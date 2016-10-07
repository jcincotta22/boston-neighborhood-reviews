class Api::ReviewsController < ApiController

  def show
    @review = Review.find(params[:id])
    @microhood = Microhood.find(params[:microhood_id])
    @review.microhood = @microhood
    @review.title = "Hey it changed!"
    vote = Vote.where(user_id: current_user.id).where(review_id: @review.id)[0]
    if !vote.nil?
      if params[:value] == "up"
        if vote.value == 1
          error = "You may only vote once per review"
          button_class = ''
        else
          vote.value = 1
          vote.save
          error = ''
          button_class = 'green'
        end
      else
        if vote.value == -1
          error = 'You may only vote once per review'
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
    render json: { error: error, id: @review.id, class: button_class, vote_count: @review.total_vote_count}
  end
end
