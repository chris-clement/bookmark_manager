require 'bookmark'

describe Bookmark do
  subject(:bookmark) { Bookmark.new}
   it 'has a list' do
    expect(bookmark.all).to eq (['Bookmark1', 'Bookmark2'])
   end 
end 