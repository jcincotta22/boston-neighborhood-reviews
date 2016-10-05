require 'rails_helper'

feature 'user updates account information' do
  scenario 'user gets to account update page from home page' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit '/'

    click_link 'Edit registration'
    expect(page).to have_button 'Update'
  end

  scenario 'user successfully edits account information' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit '/users/edit'
    fill_in 'First Name', with: 'NewName'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully'
  end

  scenario 'user edits account and leaves required field blank' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit '/users/edit'
    fill_in 'First Name', with: ''
    fill_in 'Current password', with: user.password

    click_button 'Update'
    expect(page).to have_content 'First name can't be blank'
  end

  scenario 'user edits account and does not submit current password' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit '/users/edit'
    fill_in 'First Name', with: 'NewName'
    click_button 'Update'
    expect(page).to have_content 'Current password can't be blank'
  end
end
