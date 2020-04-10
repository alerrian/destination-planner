require 'rails_helper'

RSpec.describe 'When I visit a destination' do
  it 'I should see current weather' do
    ##
    # As a user
    # When I visit "/"
    # And I click on a destination
    # Then I should be on page "/destinations/:id"
    # Then I should see the destination's name, zipcode, description, and current weather
    # The weather forecast is specific to the destination whose page I'm on
    # The forecast should include date (weekday, month and day), 
    #    current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)
    ##

    destination = Destination.create(
        name: 'A cool place',
        zip: '80910',
        description: 'An awesome place',
        image_url: 'http://placekitten.com/300/300'
      )

    visit '/'

    click_link 'Show'

    expect(current_path).to eq(destination_path(destination))

    expect(page).to have_content(destination.zip)
    expect(page).to have_content(destination.name)
    expect(page).to have_content(destination.description)

    within '.current_weather' do
      expect(page).to have_css('#date')
      expect(page).to have_css('#temp-high')
      expect(page).to have_css('#temp-low')
      expect(page).to have_css('#summary')
    end
  end
end
