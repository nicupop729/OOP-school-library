require 'json'

class StoreData
  attr_reader :books, :people, :rentals

  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def fetch_data
    fetch_books
    fetch_people
    fetch_rentals
  end

  def set_books(all_books)
    @books = all_books
    File.write('./books.json', @books)
  end

  def set_people(all_people)
    @people = all_people
    File.write('./people.json', @people)
  end

  def set_rentals(all_rentals)
    @rentals = all_rentals
    File.write('./rentals.json', @rentals)
  end

  def close_document
    @books_file.close
    @people_file.close
    @rentals_file.close
  end

  private

  def fetch_books
    exist = File.exist?('./books.json')
    unless exist
      @books_file = File.open('./books.json', 'w')
    end
    @books_file = File.open('./books.json')
    @books = @books_file.read
  end

  def fetch_people
    exist = File.exist?('./people.json')
    unless exist
      @people_file = File.open('./people.json', 'w')
    end
    @people_file = File.open('./people.json')
    @people = @people_file.read
  end

  def fetch_rentals
    exist = File.exist?('./rentals.json')
    unless exist
      @rentals_file = File.open('./rentals.json', 'w')
    end
    @rentals_file = File.open('./rentals.json')
    @rentals = @rentals_file.read
  end

end
#
# data_stored = StoreData.new()
# data_stored.fetch_data
# bookies = (JSON.parse(data_stored.books))
# bookies << {secondBook: "secondBOOOK"}
# data_stored.set_books(JSON.generate(bookies))
# p data_stored.books


