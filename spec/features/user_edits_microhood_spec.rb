require 'rails_helper'

feature 'user edits a micrhood' do
  scenario 'user successfully edits a microhood' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood, user: user)

    visit microhood_path(microhood)
    expect(page).to have_content microhood.street
    click_link 'Edit this microhood!'
    fill_in 'Street', with: 'My Street'
    click_button 'Add Microhood'
    expect(page).to have_content 'My Street'
  end

  scenario 'user tried to remove required field' do
    user = FactoryGirl.create(:user)
    neighborhood = FactoryGirl.create(:neighborhood)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood, user: user, neighborhood: neighborhood)

    visit microhood_path(microhood)
    click_link "Edit this microhood!"
    fill_in 'Street', with: ''
    click_button 'Add Microhood'

    expect(page).to have_content 'Street can\'t be blank'
  end

  scenario 'user unable to edit micrhood they did not create' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    visit microhood_path(microhood)
    expect(page).to have_no_content 'Edit this microhood'
  end
end
