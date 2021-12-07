require 'bookmark'

describe Bookmark do 
  describe '.all' do 
    it 'returns a list of bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test') 
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      bookmarks = Bookmark.new().all
      expect(bookmarks).to include 'http://www.makersacademy.com/'
      expect(bookmarks).to include 'http://www.google.com/'
      expect(bookmarks).to include 'http://www.destroyallsoftware.com'
    end
  end

  describe '.create' do
    it 'adds a bookmark to our database' do 
      bookmark = Bookmark.new 
      bookmark.create('gmail.com')
      expect(bookmark.all).to include 'gmail.com'
    end 
  end 
end
