require 'rails_helper'

feature "user adds microhoods" do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
  context "As a user" do
    context "I visit the root page" do
      before { visit root_path }

      scenario "user adds a microhood" do
        click_link("Create and Review a New Microhood")
        save_and_open_page
        expect(page).to have_content(microhood1)
        expect(page).to have_content(microhood2)
        expect(page).to have_content(microhood3)
      end
    end
  end
end
