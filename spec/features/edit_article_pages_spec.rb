require 'rails_helper'

describe "the edit an article process" do
  it "edits an article" do
    article = Article.create(:title => "Back to school", :author => "Bob", :points => 0)
    comment = Comment.create(:text => "This is cool", :user => "Barbara", :article_id => article.id)
    visit article_path(article)
    click_on "Edit Article"
    fill_in "Title", :with => "I like that"
    fill_in "Author", :with => "Helen"
    click_button "Update Article"
    expect(page).to have_content("I like that")
  end

  it "gives error when no text field is entered" do
    article = Article.create(:title => "Back to school", :author => "Bob", :points => 0)
    comment = Comment.create(:text => "This is cool", :user => "Barbara", :article_id => article.id)
    visit article_path(article)
    click_on 'Edit Article'
    fill_in 'Title', :with => ''
    click_button 'Update Article'
    expect(page).to have_content 'errors'
  end
end
