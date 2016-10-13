require 'rails_helper'

feature 'user searches for microhoods' do
  scenario 'user searches for microhood by name' do
    FactoryGirl.create(:microhood, name: 'Frank\'s Microhood', street: 'Fox Run')
    FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: 'Frank'
    click_button 'Search'
    expect(page).to have_content 'Frank\'s Microhood'
    expect(page).to have_no_content 'Downtown Area'
  end

  scenario 'user searches for microhood by street' do
    FactoryGirl.create(:microhood, name: 'Frank\'s Microhood', street: 'Fox Run')
    FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: 'Fox'
    click_button 'Search'
    expect(page).to have_content 'Frank\'s Microhood'
    expect(page).to have_no_content 'Downtown Area'
  end

  scenario 'user submits blank search and sees all microhoods' do
    microhoods = FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: ''
    click_button 'Search'
    expect(page).to have_content microhoods.first.name
    expect(page).to have_content microhoods.last.name
  end

  scenario 'search results index page should not update automatically' do
    microhoods = FactoryGirl.create_list(:microhood, 3)
    visit root_path
    fill_in :search, with: 'Main St'
    click_button 'Search'
    new_microhood = FactoryGirl.create(:microhood)
    sleep(6)
    expect(page).to have_content microhoods.first.name
    expect(page).to have_content microhoods.last.name
    expect(page).to have_no_content new_microhood.name
  end
end
