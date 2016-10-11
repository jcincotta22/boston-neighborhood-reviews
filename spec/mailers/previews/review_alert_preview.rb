# Preview all emails at http://localhost:3000/rails/mailers/review_alert
class ReviewAlertPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/review_alert/new_review
  def new_review
    ReviewAlertMailer.new_review
  end

end
