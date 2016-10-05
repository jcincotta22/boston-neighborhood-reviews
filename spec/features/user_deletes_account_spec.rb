require 'rails_helper'

feature 'user deletes account' do
  scenario 'user goes to edit registration page to delete account' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit '/'
    click_link 'Edit registration'
    expect(page).to have_button 'Cancel my account'
    click_button 'Cancel my account'
    expect(page).to have_content 'Bye! Your account'
  end
end
