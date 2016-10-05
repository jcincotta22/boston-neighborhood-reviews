require 'rails_helper'

feature 'user can create an account' do
  # scenario 'user clicks 'Sign up' and is brought to page with form to create new account' do
  #
  #   visit '/'
  #   expect(page).to have_content 'Sign up'
  #
  #   click_button 'Sign up'
  #
  #   expect(page).to have_content 'Sign up'
  # end

  scenario 'user successfully creates new account' do
    visit '/users/sign_up'

    fill_in 'First Name', with: 'Frank'
    fill_in 'Last Name', with: 'LaNasa'
    fill_in 'Email', with: 'fjlanasa@gmail.com'
    fill_in 'Password', with: 'password1!'
    fill_in 'Password confirmation', with: 'password1!'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_content 'Boston Microhoods'
  end

  scenario 'user unsuccessfully creates account' do
    visit '/users/sign_up'

    click_button 'Sign up'
    expect(page).to have_content('First name can\'t be blank')
    expect(page).to have_content('Email can\'t be blank')
  end

end
