require 'bookmark'

describe Bookmark do 
  describe '.all' do 
    it 'returns a list of bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test') 
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers','http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com/');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Destroy Stuff', 'http://www.destroyallsoftware.com');")
      bookmarks = Bookmark.new().all
      expect(bookmarks).to include 'Makers'
      expect(bookmarks).to include 'Google'
      expect(bookmarks).to include 'Destroy Stuff'
    end
  end

  describe '.create' do
    it 'adds a bookmark to our database' do 
      bookmark = Bookmark.new 
      bookmark.create('emails', 'gmail.com')
      expect(bookmark.all).to include 'emails'
    end 
  end 
end
