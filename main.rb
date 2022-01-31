require './display_rentals'
require './list'
require './books_collection'
require './people'

class Main
  def initialize
    @new_person = People.new
    @new_book = Books.new
    @new_rentals = Rentals.new
    @list_people = List.new(@new_person.people, 'people')
    @list_book = List.new(@new_book.books, 'book')
  end

  def print_options
    puts 'Please choose an option by entering a number:'
    puts '1- List all books'
    puts '2- List all people'
    puts '3- Create a person'
    puts '4- Create a book'
    puts '5- Create a rental'
    puts '6- List all rentals for a given person id '
    puts '7- exit'
  end
  # rubocop:disable Metrics/CyclomaticComplexity

  def select_option
    loop do
      print_options
      input = gets.chomp
      case input
      when '1'
        @list_book.list_items
      when '2'
        @list_people.list_items
      when '3'
        @new_person.create_person
      when '4'
        @new_book.create_book
      when '5'
        @new_rentals.create_rental(@list_people, @list_book)
      when '6'
        @new_rentals.list_rentals_for_person(@list_people)
      when '7'
        break
      end
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
end

test = Main.new
test.select_option
