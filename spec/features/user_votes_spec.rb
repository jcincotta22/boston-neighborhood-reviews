require 'rails_helper'

feature 'user votes', js:true do
  scenario 'user votes' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    microhood = FactoryGirl.create(:microhood)
    binding.pry
    review = FactoryGirl.create(:review, microhood: microhood)
    review2 = FactoryGirl.create(:review, microhood: microhood)
    binding.pry
    visit microhood_path(microhood)
  end
end
