require 'rails_helper'

feature 'User Views all microhood', js: true do
  scenario 'User views all microhoods' do
    microhoods = FactoryGirl.create_list(:microhood, 2)
    visit root_path
    expect(page).to have_content(microhoods.first.street)
    expect(page).to have_content(microhoods.last.street)
  end
end
