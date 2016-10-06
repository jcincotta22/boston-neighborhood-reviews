require 'rails_helper'

feature 'user adds review to microhood' do
  scenario 'user visits microhood show page and adds a review' do
    microhoods = FactoryGirl.create_list(:microhood, 2)
    user = FactoryGirl.create(:user)
    visit root_path
    login_as(user, scope: :user)
    save_and_open_page
    click_link("#{microhoods.first.street}")
    expect(page).to have_content("Reviews for #{microhoods.first.street}")
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

  scenario 'user visits show page and attempts to submit review with incomplete form' do
    microhood = FactoryGirl.create(:microhood)
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit "/microhoods/#{microhood.id}"
    fill_in :review_title, with: 'Ratings for Microhood'
    fill_in :review_safety_rating, with: 4
    fill_in :review_schools_rating, with: 4
    fill_in :review_public_transport, with: 4
    fill_in :review_body, with: ''
    click_button('Add Review')
    find_field(:review_title).value.should eq 'Ratings for Microhood'
    expect(page).to have_content('Body is too short (minimum is 50 characters)')
  end

  scenario 'unauthenticated user attempts to submit a review' do
    microhood = FactoryGirl.create(:microhood)
    visit "/microhoods/#{microhood.id}"
    fill_in('review_title', with: 'Ratings for Main St')
    fill_in('review_safety_rating', with: 4)
    fill_in('review_schools_rating', with: 4)
    fill_in('review_food_entertainment', with: 4)
    fill_in('review_public_transport', with: 3)
    fill_in('review_body', with: 'It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
    click_button('Add Review')
    expect(page).to have_content 'User must be signed in'
  end
end
