require 'rails_helper'

feature 'user adds review to microhood' do
  scenario 'user visits microhood show page and adds a review' do
    microhood = FactoryGirl.create(:microhood)
    user = FactoryGirl.create(:user)
    visit microhood_path(microhood)
    login_as(user, scope: :user)
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
    expect(page).to have_content('Review added successfully!')
    expect(page).to have_content('It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
  end

  scenario 'user visits show page and attempts to submit review with incomplete form' do
    microhood = FactoryGirl.create(:microhood)
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit microhood_path(microhood)
    fill_in 'review_title', with: 'Ratings for Microhood'
    fill_in 'review_safety_rating', with: 4
    fill_in 'review_schools_rating', with: 4
    fill_in 'review_food_entertainment', with: 4
    fill_in 'review_public_transport', with: 4
    fill_in 'review_body', with: ''
    click_button('Add Review')
    find_field('review_title').value.should eq 'Ratings for Microhood'
    expect(page).to have_content('Body is too short (minimum is 50 characters)')
  end

  scenario 'unauthenticated user attempts to submit a review' do
    microhood = FactoryGirl.create(:microhood)
    visit microhood_path(microhood)
    fill_in('review_title', with: 'Ratings for Main St')
    fill_in('review_safety_rating', with: 4)
    fill_in('review_schools_rating', with: 4)
    fill_in('review_food_entertainment', with: 4)
    fill_in('review_public_transport', with: 3)
    fill_in('review_body', with: 'It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
    click_button('Add Review')
    expect(page).to have_content 'User must be signed in'
  end

  scenario 'authorized user tries to submit a rating over 5' do
    microhood = FactoryGirl.create(:microhood)
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit microhood_path(microhood)
    fill_in 'review_title', with: 'Ratings for Microhood'
    fill_in 'review_safety_rating', with: 6
    fill_in 'review_schools_rating', with: 6
    fill_in 'review_public_transport', with: 6
    fill_in 'review_food_entertainment', with: 6
    fill_in 'review_body', with: 'It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf'
    click_button('Add Review')
    expect(page).to have_content 'Safety rating must be less than or equal to 5'
    expect(page).to have_content 'Food entertainment must be less than or equal to 5'
    expect(page).to have_content 'Public transport must be less than or equal to 5'
    expect(page).to have_content 'Safety rating must be less than or equal to 5'
  end
end
