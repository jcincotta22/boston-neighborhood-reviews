require 'rails_helper'

RSpec.describe Neighborhood do
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

  let(:microhood2) {
    Microhood.create(
      street: "Main Lane",
      zip: "02551",
      neighborhood_id: neighborhood.id,
      user_id: user.id
    )
  }

  it "has the expected properties" do
    expect(neighborhood.name).to eq("Dorchester")
    expect(neighborhood.microhoods).to eq([microhood, microhood2])
  end

end
