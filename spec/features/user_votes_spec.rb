require 'rails_helper'

feature 'user votes', js:true do
  scenario 'authenticated user upvotes once' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
    expect(page).to have_content 'Vote count: 1'
  end
  scenario 'authenticated user upvotes twice which removes vote' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
    click_button 'Upvote'
    expect(page).to have_content 'Vote count: 0'
  end

  scenario 'authenticated user upvotes then switches to downvote' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
    click_button 'Downvote'
    expect(page).to have_content 'Vote count: -1'
  end
end
