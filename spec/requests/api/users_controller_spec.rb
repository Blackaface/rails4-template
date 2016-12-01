require 'rails_helper'

RSpec.describe Api::UsersController, type: :request do

  let!(:user) { User.create!(email: 'xxx@example.com', password: '12341234') }

  it '#index' do
    get 'http://api.localhost/users.json',
      params: { abc: 1 },
      headers: { 'HTTP_X_TOKEN' => '123456' }
    expect(response.status).to eq(200)
    expect(response.body).to include(user.email)
  end

end
