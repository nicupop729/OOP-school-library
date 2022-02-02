require './create_rental'
require './store_data'

class Rentals
  def initialize
    @data = StoreData.new
    @data.fetch_data
    @rentals = JSON.parse(@data.rentals)
  end

  def create_rental(list_people, list_books)
    puts 'Select the index of desired book from the following list:'
    list_books.list_items('book')
    book_idx = gets.chomp.to_i
    puts 'Select the index of the person from the following list:'
    list_people.list_items('people')
    person_idx = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, list_books.list[book_idx - 1]["title"], list_people.list[person_idx - 1]["name"], list_people.list[person_idx - 1]["id"])
    p rental
    @rentals << ({date: rental.date, book: rental.book, person: rental.person, id: rental.id})
    @data.set_rentals(JSON.generate(@rentals))
    puts 'Rental created successfully'
    puts
  end

  def list_rentals_for_person(list_people)
    puts 'Display people: '
    list_people.list_items('people')
    print 'ID of person: '
    id_of_person = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent["date"]}, Book: #{rent["book"]}, renter: #{rent["person"]}" if rent["id"] == id_of_person
    end
    puts
  end
end
