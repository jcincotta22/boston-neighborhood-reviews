require 'rails_helper'

feature 'user votes', js:true do
  scenario 'user upvotes once' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
    expect(page).to have_content 'Vote count: 1'
  end

end
