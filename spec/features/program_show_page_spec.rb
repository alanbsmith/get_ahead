require "feature_helper"

describe "the program show view", type: :feature do

  before(:each) do
    @program = FactoryGirl.create(:program)

  end

  it "as a guest I can visit an individual program page" do
    visit programs_path
    click_link(@program.facility_name)

    expect(page).to have_content(@program.facility_name)
    expect(current_path).to eq(program_path(@program))
  end

  it "as a guest user I cannot see the contact email form" do
    visit programs_path
    click_link(@program.facility_name)

    expect(page).to have_content("Sign in to send an email")
    expect(page).to have_link("Sign in with Google")
    expect(page).to_not have_content("Subject")
  end

  it "as a guest user I cannot submit a review" do
    visit programs_path
    click_link(@program.facility_name)

    expect(page).to have_content("You need to sign in to leave a review.")
    expect(page).to have_link("Sign in with Google")
    expect(page).to_not have_content("Title")
  end

  xit "as a signed in user I can see the contact email form" do
    login_with_oauth
    save_and_open_page
    visit programs_path
    click_link(@program.facility_name)

    expect(page).to_not have_content("Sign in to send an email")
    expect(page).to have_link("Send")
    expect(page).to have_content("Subject")    
  end

  xit "as a signed in user I can submit a review" do
    visit programs_path
    click_link(@program.facility_name)

    expect(page).to_not have_content("You need to sign in to leave a review.")
    expect(page).to have_link("Submit")
    expect(page).to have_content("Title")

    fill_in(review[title], with: "My kids love this place!")
  end


end

