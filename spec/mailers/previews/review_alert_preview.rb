# Preview all emails at http://localhost:3000/rails/mailers/review_alert
class ReviewAlertPreview < ActionMailer::Preview
  def new_review
    ReviewAlertMailer.new_review
  end
end
