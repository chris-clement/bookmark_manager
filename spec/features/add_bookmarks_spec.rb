feature 'Adding bookmarks' do 
  scenario 'A user can add bookmarks' do 
  visit '/'
  fill_in 'url', with: 'gmail.com'
  click_on 'Submit'
  expect(page).to have_content 'gmail.com'
  end
end