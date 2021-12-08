require 'pg'

class Bookmark
  
  def all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map {|bookmark| bookmark['title']}
  end

  def create(title, url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}');")
  end 

  def display_links
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map {|bookmark| "<a href=#{bookmark['url']}> #{bookmark['title']}"}
    # hyperlinks.each do |link|
    #   puts link
    # end
  end
  
end 