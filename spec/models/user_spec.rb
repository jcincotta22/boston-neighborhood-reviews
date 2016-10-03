require 'rails_helper'

RSpec.describe User do
  let(:user){
    User.create(user_name: "Jeff", profile_pic_url: "http://bit.ly/2cYj2Ex")
  }

  let(:neighborhood){
    Neighborhood.create(name: "Dorchester")
  }

  let(:microhood) {
    Microhood.create(
      street: "Cherry Lane",
      zip: "02451",
      neighborhood_id: neighborhood.id,
      user_id: user.id
    )
  }

  it "has the expected properties" do
    expect(microhood.user).to eq(user)
    expect(microhood.neighborhood).to eq(neighborhood)
    expect(microhood.street).to eq("Cherry Lane")
    expect(microhood.zip).to eq("02451")
  end

end
