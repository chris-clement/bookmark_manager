require 'pg'

feature 'Viewing bookmarks' do 
  scenario 'A user can view bookmarks' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com/');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Destroy Stuff', 'http://www.destroyallsoftware.com');")
    visit '/bookmarks'
    expect(page).to have_content "Makers"
    expect(page).to have_content "Google"
    expect(page).to have_content "Destroy Stuff"
  end
end