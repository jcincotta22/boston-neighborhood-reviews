require 'rails_helper'

RSpec.describe Microhood do
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

  it "has the expected properties" do
    expect(microhood.user).to eq(user)
    expect(microhood.neighborhood).to eq(neighborhood)
    expect(microhood.name).to eq("downtown")
    expect(microhood.street).to eq("Cherry Lane")
    expect(microhood.zip).to eq("02451")
  end

end
