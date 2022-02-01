require './create_rental'

class Rentals
  def initialize
    @rentals = []
  end

  def create_rental(list_people, list_books)
    puts 'Select the index of desired book from the following list:'
    list_books.list_items
    book_idx = gets.chomp.to_i
    puts 'Select the index of the person from the following list:'
    list_people.list_items
    person_idx = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, list_books.list[book_idx - 1], list_people.list[person_idx - 1])
    @rentals << rental
    puts 'Rental created successfully'
    puts
  end

  def list_rentals_for_person(list_people)
    puts 'Display people: '
    list_people.list_items
    print 'ID of person: '
    id_of_person = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title}, renter: #{rent.person.name}" if rent.person.id == id_of_person
    end
    puts
  end
end
