require 'rails_helper'

feature 'user creates a microhood' do
  before { neighborhood = Neighborhood.create(name: 'West Roxbury') }

  scenario 'user visits the page of microhoods, clicks create microhood' do
    user = FactoryGirl.create(:user)
    visit root_path
    login_as(user, scope: :user)
    expect(page).to have_content('Boston Microhoods')
    click_link('Create and Review a New Microhood')
    expect(page).to have_content('New Microhood')
    expect(page).to have_content('Neighborhood')
    expect(page).to have_content('Name')
    expect(page).to have_content('Street')
    expect(page).to have_content('Zip')
    expect(page).to have_content('Description')
  end

  scenario 'user fills out form and creates a new microhood' do
    user = FactoryGirl.create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link('Create and Review a New Microhood')
    select 'West Roxbury', from: 'microhood-neighborhood-id'
    fill_in('Name', with: 'Hooood')
    fill_in('Street', with: 'Hooood St')
    fill_in('Zip', with: '10000')
    click_button('Add Microhood')
    expect(page).to have_content('Successfully Created New Microhood')
    expect(page).to have_content('Reviews for Hooood St')
  end

  scenario 'user submits incomplete form' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_microhood_path
    select 'West Roxbury', from: 'microhood-neighborhood-id'
    fill_in('Street', with: 'Hooood St')
    fill_in('Zip', with: '10000')
    click_button('Add Microhood')
    expect(page).to have_content('New Microhood')
    expect(page).to have_content('Name can\'t be blank')
  end

  scenario 'unauthenticated user attempts to create microhood' do
    user = FactoryGirl.create(:user)
    visit new_microhood_path
    select 'West Roxbury', from: 'microhood-neighborhood-id'
    fill_in('Name', with: 'Hooood')
    fill_in('Street', with: 'Hooood St')
    fill_in('Zip', with: '10000')
    click_button('Add Microhood')
    expect(page).to have_content('New Microhood')
    expect(page).to have_content('You must be signed in')
  end
end
