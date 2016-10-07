class ReviewAlertMailer < ActionMailer::Base
  default from: "no_reply@microhood.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_alert_mailer.new_review.subject
  #
  def new_review(review)
    @review = review

    mail(to: @review.microhood.user.email,
        subject: "New Review")
  end
end
