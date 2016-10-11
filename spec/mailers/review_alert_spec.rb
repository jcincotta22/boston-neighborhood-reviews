require "rails_helper"

RSpec.describe ReviewAlertMailer, type: :mailer do
  ActionMailer::Base.deliveries = []
  describe "new_review" do
    let(:review) { FactoryGirl.create(:review)}
    let(:mail) { ReviewAlertMailer.new_review(review) }
    it "renders the headers" do
      expect(mail.subject).to eq("New Review")
      expect(mail.to).to eq([review.microhood.user.email])
      expect(mail.from).to eq(["no_reply@microhood.com"])
    end
    it "body of mail is as expected" do
      expect(mail.body.encoded).to match("Hello #{review.microhood.user.first_name}, #{review.microhood.name} was just reviewed!")
    end
    it "renders the body" do
      mail.deliver
      expect(ActionMailer::Base.deliveries.size).to eq(1)
    end
  end
end
