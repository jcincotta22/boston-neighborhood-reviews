require 'rails_helper'

feature 'user adds review to microhood' do
  scenario 'user visits microhood show page and adds a review' do
    microhoods = FactoryGirl.create_list(:microhood, 2)
    user = FactoryGirl.create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link('1 Main St')
    expect(page).to have_content('Reviews for 1 Main St')
    fill_in('review_title', with: 'Ratings for Main St')
    fill_in('review_safety_rating', with: 4)
    fill_in('review_schools_rating', with: 4)
    fill_in('review_food_entertainment', with: 4)
    fill_in('review_public_transport', with: 3)
    fill_in('review_body', with: 'It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
    click_button('Add Review')
    expect(page).to have_content('3.8')
    expect(page).to have_content('Ratings for Main St')
    expect(page).to have_content('Safety Rating')
    expect(page).to have_content('School Rating')
    expect(page).to have_content('Food and entertainment')
    expect(page).to have_content('Public Transportation')
    expect(page).to have_content('It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
  end
end
