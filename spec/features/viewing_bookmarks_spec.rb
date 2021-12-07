feature 'Viewing our first bookmark' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content ('Bookmark1')
  end
end 