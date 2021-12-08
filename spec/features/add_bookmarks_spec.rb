feature 'Adding bookmarks' do 
  scenario 'A user can add bookmarks' do 
  visit '/'
  fill_in 'url', with: 'gmail.com'
  fill_in 'title', with: 'emails'
  click_on 'Submit'
  expect(page).to have_content 'emails'
  end
end