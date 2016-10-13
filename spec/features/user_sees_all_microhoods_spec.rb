require 'rails_helper'

feature 'User Views all microhood', js: true do
  scenario 'User views all microhoods' do
    microhoods = FactoryGirl.create_list(:microhood, 2)
    visit root_path
    expect(page).to have_content(microhoods.first.name)
    expect(page).to have_content(microhoods.last.name)
  end

  scenario 'Microhoods index page updates after 5 seconds' do
    FactoryGirl.create_list(:microhood, 2)
    visit root_path
    new_microhood = FactoryGirl.create(:microhood)
    expect(page).to have_no_content(new_microhood.name)
  end

  scenario 'Microhoods index page updates after 5 seconds' do
    microhoods = FactoryGirl.create_list(:microhood, 2)
    visit root_path
    new_microhood = FactoryGirl.create(:microhood)
    sleep(5)
    expect(page).to have_content(new_microhood.name)
  end
end
