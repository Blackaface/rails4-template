require 'rails_helper'

RSpec.describe Api::UsersController, type: :request do

  let!(:user) { User.create!(email: 'xxx@example.com', password: '12341234') }

  it '#index' do
    get 'http://api.localhost/users.json',
      params: { abc: 1 },
      headers: { 'HTTP_X_TOKEN' => '123456' }
    expect(response.status).to eq(200)
    expect(response.body).to include(user.email)
    result = JSON.parse(response.body)
    expect(result.first["id"]).to eq(user.id)
  end

  it '#create' do
    post 'http://api.localhost/users.json',
      params: { user: { email: 'mars@5fpro.com', password: '12341234' } },
      headers: { 'HTTP_X_TOKEN' => '123456' }
    expect(response.status).to eq(200)
    result = JSON.parse(response.body)
    expect(result['user']['id']).to eq(User.last.id)
  end
end
