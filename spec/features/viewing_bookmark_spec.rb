feature 'Viewing our first bookmark' do
  scenario 'the screen displays a bookmark' do
    visit('/')
    visit ('/Bookmarks')
    expect(page).to have_content ('Bookmark1')
  end
end 