module VoteHelper
  def update_vote(vote, params_value)
    button_class = ''
    if params_value == "up"
      if vote.value == 1
        vote.update_attribute(:value, 0)
        button_class = ''
      else
        vote.update_attribute(:value, 1)
        button_class = 'green'
      end
    else
      if vote.value == -1
        vote.update_attribute(:value, 0)
        button_class = ''
      else
        vote.update_attribute(:value, -1)
        button_class = 'red'
      end
    end
    button_class
  end

  def create_vote(params_value, review)
    button_class = ''
    if params_value == "up"
      Vote.create(value: 1, user_id: current_user.id, review_id: review.id)
      button_class = 'green'
    else
      Vote.create(value: -1, user_id: current_user.id, review_id: review.id)
      button_class = 'red'
    end
    button_class
  end

  def calculate_votes(review)
    count = 0
    votes = Vote.where(review_id: review.id)
    votes.each do |vote|
      count += vote.value
    end
    count
  end
end
