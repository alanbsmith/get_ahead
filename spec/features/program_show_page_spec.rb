require "feature_helper"

describe "the program show view", type: :feature do

  before(:each) do
    @program = FactoryGirl.create(:program)
  end

  it "as a guest I can visit an individual program page" do
    visit programs_path
    click_link("View")

    expect(page).to have_content(@program.facility_name)
    expect(current_path).to eq(program_path(@program))
  end
end

