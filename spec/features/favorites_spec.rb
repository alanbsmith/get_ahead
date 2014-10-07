require "feature_helper"

describe "viewing favorites", type: :feature do

  before(:each) do
    @program = FactoryGirl.create(:program)
  end

  it "can add programs to my favorites" do
    visit programs_path
    click_link("View")
    click_button("Add to Favorites")

    expect(current_path).to eq(favorites_path)
    expect(page).to have_content("#{@program.facility_name} has been added to your favorites")
    expect(page).to have_content("#{@program.facility_name}")
  end
end