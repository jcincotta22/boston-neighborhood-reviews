require 'rails_helper'

RSpec.describe Neighborhood do
  let(:user){
    User.create(first_name: "Jeff", last_name: "Cinc", email: "blah@gmail.com", password: "12345abc!A")
  }

  let(:neighborhood){
    Neighborhood.create(name: "Dorchester")
  }

  let(:microhood) {
    Microhood.create(
      name: "downtown",
      street: "Cherry Lane",
      zip: "02451",
      neighborhood_id: neighborhood.id,
      user_id: user.id
    )
  }

  let(:microhood2) {
    Microhood.create(
      name: "uptown",
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
