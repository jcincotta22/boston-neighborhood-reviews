require 'rails_helper'

RSpec.describe Review do
  let(:user) do
    User.create(first_name: 'Jeff', last_name: 'Cinc', email: 'blah@gmail.com', password: '12345abc!A')
  end
  it 'has the expected properties' do
    expect(user.first_name).to eq('Jeff')
    expect(user.last_name).to eq('Cinc')
    expect(user.email).to eq('blah@gmail.com')
    expect(user.password).to eq('12345abc!A')
  end
end
