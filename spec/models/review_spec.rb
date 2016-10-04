require 'rails_helper'

RSpec.describe Review do
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

  let(:review) {
    Review.create(
      rating: 3.3,
      safety_rating: 3,
      schools_rating: 5,
      food_entertainment: 4,
      public_transport: 1,
      title: "Dorchester Review",
      body: "This place is totally horrible! I would never live here if I could afford to move. But sadly, I'm stuck here. Wahhhhhhhhhh",
      user_id: user.id,
      microhood_id: microhood.id
    )
  }

  it "has the expected properties" do
    expect(review.user).to eq(user)
    expect(review.schools_rating).to eq(5)
    expect(review.food_entertainment).to eq(4)
    expect(review.public_transport).to eq(1)
    expect(review.title).to eq("Dorchester Review")
    expect(review.body).to eq("This place is totally horrible! I would never live here if I could afford to move. But sadly, I'm stuck here. Wahhhhhhhhhh")
    expect(review.microhood_id).to eq(microhood.id)
  end

end
