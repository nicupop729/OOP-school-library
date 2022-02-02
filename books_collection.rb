require './create_book'
require './store_data'

class Books
  attr_accessor :books

  def initialize
    @data = StoreData.new
    @data.fetch_data
    @books = JSON.parse(@data.books)
  end

  def book_details
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    title, author = book_details
    new_book = Book.new(title, author)
    @books << ({title: new_book.title, author: new_book.author })
    @data.set_books(JSON.generate(@books))
    puts 'New book created successfully'
    puts
  end
end
