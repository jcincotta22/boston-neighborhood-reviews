require 'rails_helper'

feature 'User is notified via email after review of their created microhood' do
  scenario 'user reviews microhood' do
    ActionMailer::Base.deliveries = []
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    visit microhood_path(microhood)
    expect(page).to have_content microhood.street
    fill_in('review_title', with: 'Ratings for Main St')
    fill_in('review_safety_rating', with: 4)
    fill_in('review_schools_rating', with: 4)
    fill_in('review_food_entertainment', with: 4)
    fill_in('review_public_transport', with: 3)
    fill_in('review_body', with: 'It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
    click_button('Add Review')
    expect(ActionMailer::Base.deliveries.size).to eq(1)
  end
  scenario 'user recieves email after microhood is reviewed' do
    ActionMailer::Base.deliveries = []
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    visit microhood_path(microhood)
    fill_in('review_title', with: 'Ratings for Main St')
    fill_in('review_safety_rating', with: 4)
    fill_in('review_schools_rating', with: 4)
    fill_in('review_food_entertainment', with: 4)
    fill_in('review_public_transport', with: 3)
    fill_in('review_body', with: 'It is a nice place.  askdjhfasdkjfhasdkfjhasdkfjhasdfkjhasdfkjhasdfkasdflaskjfalsdkfjasdlfkjasdf')
    click_button('Add Review')
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email.subject).to eq('New Review')
    expect(last_email.from).to eq(["no_reply@microhood.com"])
    first_name = microhood.reviews.last.microhood.user.first_name
  end

end
