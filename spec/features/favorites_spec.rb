require "feature_helper"

describe "viewing favorites", type: :feature do

  before(:each) do
    @program = FactoryGirl.create(:program)
  end

  it "can add programs to favorites" do
    visit programs_path
    click_link(@program.facility_name)
    click_button("Add to Favorites")
  
    expect(page).to have_content("#{@program.facility_name} has been added to your favorites")
    visit favorites_path
    expect(page).to have_content("#{@program.facility_name}")
  end

  it "can remove programs from favorites" do
    visit programs_path
    click_link(@program.facility_name)
    click_button("Add to Favorites")

    visit favorites_path
    expect(page).to have_content("#{@program.facility_name}")

    click_link("")
    expect(page).to_not have_content("#{@program.facility_name}")
  end

  it "cannot add multiples of the same program to favorites" do
    visit programs_path
    click_link("")
    expect(page).to have_content("#{@program.facility_name} has been added to your favorites")

    click_link("")
    expect(page).to have_content("You've already favorited #{@program.facility_name}")
  end
end