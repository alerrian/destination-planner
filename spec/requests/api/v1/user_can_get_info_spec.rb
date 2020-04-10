require 'rails_helper'

RSpec.describe 'user can get a destination' do
  it 'when making a request to api/v1/destination/:id' do
    destination = Destination.create(
      name: 'A cool place',
      zip: '80910',
      description: 'An awesome place',
      image_url: 'http://placekitten.com/300/300'
    )

    get "/api/v1/destinations/#{destination.id}"

    expect(response).to be_successful

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes]).to have_key(:name)
    expect(resp[:data][:attributes]).to have_key(:zip)
    expect(resp[:data][:attributes]).to have_key(:description)
    expect(resp[:data][:attributes]).to have_key(:image_url)
  end
end
