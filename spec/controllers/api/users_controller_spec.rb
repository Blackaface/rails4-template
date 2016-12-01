require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let!(:user) { User.create!(email: 'xxx@example.com', password: '12341234') }

  before do
    # respond_error unless request.headers.to_h["HTTP_X_TOKEN"] == "123456"
    request.headers['HTTP_X_TOKEN'] = '123456'
  end

  it '#index' do

    get :index, abc: 1
    expect(response.status).to eq(200)
  end
end
