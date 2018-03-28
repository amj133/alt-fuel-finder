require 'rails_helper'

feature "user can search for stations" do
  context "by zipcode" do
    it "10 closest electric and propane stations displayed" do
      visit root_path

      fill_in(:q, with: 80203)
      click_on("Locate")

      expect(current_path).to eq(search_path)
      expect(page).to have_content("10 Closest Stations Serving Electric or Propane")

      within(first(".station-info")) do
        expect(page).to have_css(".station-name")
        expect(page).to have_css(".station-address")
        expect(page).to have_css(".station-fuel-types")
        expect(page).to have_css(".station-distance")
        expect(page).to have_css(".station-access-times")
      end
    end
  end
end


# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
