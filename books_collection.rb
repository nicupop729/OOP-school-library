require './create_book'

class Books
  attr_accessor :books

  def initialize
    @books = []
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
    @books << new_book
    puts 'New book created successfully'
    puts
  end
end
