require 'rails_helper'

feature 'user searches for microhoods' do
  scenario 'user searches for microhood by name' do
    microhood = FactoryGirl.create(:microhood, name: 'Frank\'s Microhood', street: 'Fox Run')
    microhoods = FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: 'Frank'
    click_button 'Search'
    expect(page).to have_content 'Fox Run'
    expect(page).to have_no_content 'Main St'
  end

  scenario 'user searches for microhood by street' do
    microhood = FactoryGirl.create(:microhood, name: 'Frank\'s Microhood', street: 'Fox Run')
    microhoods = FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: 'Fox'
    click_button 'Search'
    expect(page).to have_content 'Fox Run'
    expect(page).to have_no_content 'Main St'
  end

  scenario 'user submits blank search and sees all microhoods' do
    microhoods = FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: ''
    click_button 'Search'
    expect(page).to have_content microhoods.first.street
    expect(page).to have_content microhoods.last.street
  end

  scenario 'search results index page should not update automatically' do
    microhoods  = FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: 'Main St'
    click_button 'Search'
    new_microhood = FactoryGirl.create(:microhood)
    sleep(6)
    expect(page).to have_content microhoods.first.street
    expect(page).to have_content microhoods.last.street
    expect(page).to have_no_content new_microhood.street
  end
end
