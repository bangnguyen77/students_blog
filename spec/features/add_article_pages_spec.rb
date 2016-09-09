require 'rails_helper'

describe "the add an article process" do
  it "adds a new article" do
    visit articles_path
    click_link "New Article"
    fill_in "Title", :with => "Back to school"
    fill_in "Author", :with => "Bob"
    click_on "Create Article"
    expect(page).to have_content "Back to school"
  end

  it "gives error when nothing is entered in the text field" do
    visit new_article_path
    click_on "Create Article"
    expect(page).to have_content("errors")
  end
end
