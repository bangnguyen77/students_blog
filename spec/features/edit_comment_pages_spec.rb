require 'rails_helper'

describe "the edit a comment process" do
  it "edits a comment" do
    article = Article.create(:title => "Back to school", :author => "Bob", :points => 0)
    comment = Comment.create(:text => "This is cool", :user => "Barbara", :article_id => article.id)
    visit article_path(article)
    click_on "Edit"
    fill_in "Text", :with => "I like that"
    fill_in "User", :with => "Helen"
    click_button "Update Comment"
    expect(page).to have_content("I like that")
  end

  it "gives error when no text field is entered" do
    article = Article.create(:title => "Back to school", :author => "Bob", :points => 0)
    comment = Comment.create(:text => "This is cool", :user => "Barbara", :article_id => article.id)
    visit article_path(article)
    click_on 'Edit'
    fill_in 'Text', :with => ''
    click_button 'Update Comment'
    expect(page).to have_content 'errors'
  end
end
