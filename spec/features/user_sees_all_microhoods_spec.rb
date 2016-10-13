require 'rails_helper'

feature 'User Views all microhood' do
  scenario 'User views all microhoods' do
    microhoods = FactoryGirl.create_list(:microhood, 2)
    visit root_path
    expect(page).to have_content(microhoods.first.name)
    expect(page).to have_content(microhoods.last.name)
  end
end
