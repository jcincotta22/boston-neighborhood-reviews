require 'rails_helper'

feature 'admin deletes a review' do
  scenario 'admin deletes a review they did not create' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    expect(page).to have_content microhood.street
    expect(page).to have_content review.title
    click_button 'Delete Review'
    expect(page).to have_no_content review.title
  end
end
