require 'rails_helper'

feature 'admin deletes a microhood' do
  scenario 'admin deletes a microhood they did not create' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)

    visit microhood_path(microhood)
    expect(page).to have_content microhood.street
    click_button 'Delete Microhood'

    expect(page).to have_content 'Boston Microhoods'
    expect(page).to have_no_content microhood.street
  end
end
