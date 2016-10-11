require 'rails_helper'

feature 'user votes', js:true do
  scenario 'user votes' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
  end
end
