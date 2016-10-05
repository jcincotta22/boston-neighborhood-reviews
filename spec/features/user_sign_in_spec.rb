require 'rails_helper'

feature 'user sign in' do
  scenario 'user gets to login page from home page' do
    visit '/'
    expect(page).to have_content 'Reviews'
    click_link 'Login'

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
  scenario 'user successfully signs in' do
    visit '/users/sign_in'

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

    user = FactoryGirl.create(:user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'user attempts to sign in with blank form' do
    visit '/users/sign_in'

    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'user attempts to sign in without creating an account' do
    visit 'users/sign_in'

    fill_in 'Email', with: 'exampleemail@gmail.com'
    fill_in 'Password', with: 'mysupersecurepassword'

    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'user sign out' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit '/'
    expect(page).to have_content 'Reviews'
    expect(page).to have_content 'Edit registration'
    expect(page).to have_content 'Logout'

    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully'
    expect(page).to have_content 'Reviews'
    expect(page).to have_link 'Register'
    expect(page).to have_link 'Login'
  end
end
