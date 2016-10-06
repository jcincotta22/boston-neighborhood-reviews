require 'rails_helper'

feature 'user deletes a microhood' do
  scenario 'user successfully deletes a microhood' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood, user: user)

    visit microhood_path(microhood)
    expect(page).to have_content microhood.street
    click_button 'Delete Microhood'

    expect(page).to have_content 'Boston Microhoods'
    expect(page).to have_no_content microhood.street
  end

  scenario 'user unable to delete microhood they did not create' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    visit microhood_path(microhood)
    expect(page).to have_no_button 'Delete Microhood'
  end
end
