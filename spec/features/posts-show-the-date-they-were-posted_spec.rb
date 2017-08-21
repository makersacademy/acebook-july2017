require 'rails_helper'

RSpec.feature "Date Posted", type: :feature do
  before do
    time = Time.now.utc
    Timecop.freeze(time)
  end

  after do
    Timecop.return
  end

  scenario "Newly created posts show the date they were posted" do
    allow(Time).to receive(:now).and_return(Time.now.utc)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    timenow = Time.now
    click_button "Submit"
    expect(page).to have_content(timenow.strftime("%H:%M (%d/%m/%y)"))
  end
end
