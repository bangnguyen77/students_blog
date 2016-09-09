require 'rails_helper'

describe "the add a comment process" do
  it "add a new comment" do
    article = Article.create(:title => "Back to school", :author => "Bob", :points => 0)
    visit new_article_comment_path(article)
    fill_in "Text", :with => "some stuff"
    fill_in "User", :with => "Bob"
    click_button "Create Comment"
    expect(page).to have_content "some stuff"
  end

  it "gives error when nothing is entered in the text field" do
    article = Article.create(:title => "Back to school", :author => "Bob", :points => 0)
    visit new_article_comment_path(article)
    click_button "Create Comment"
    expect(page).to have_content("errors")
  end
end
