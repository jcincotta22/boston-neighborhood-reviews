require 'rails_helper'

feature 'user votes', js:true do
  scenario 'authenticated user upvotes once' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
    sleep(3)
    expect(page).to have_content 'Vote count: 1'
    page.find(".up-button-#{review.id}")[:class].include?("green")
  end

  scenario 'authenticated user upvotes twice which removes vote' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    review = FactoryGirl.create(:review, microhood: microhood)
    visit microhood_path(microhood)
    click_button 'Upvote'
    click_button 'Upvote'
    sleep(3)
    expect(page).to have_content 'Vote count: 0'
    page.find(".up-button-#{review.id}")[:class].exclude?("green")
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
