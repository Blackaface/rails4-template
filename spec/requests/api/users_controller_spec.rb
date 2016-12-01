require 'rails_helper'

RSpec.describe Api::UsersController, type: :request do

  it '#index' do
    get 'http://api.localhost/users.json',
      params: { abc: 1 },
      headers: { 'HTTP_X_TOKEN' => '123456' }
    expect(response.status).to eq(200)
  end

end
