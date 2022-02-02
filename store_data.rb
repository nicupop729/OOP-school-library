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

  def books_set(all_books)
    @books = all_books
    File.write('./books.json', @books)
  end

  def people_set(all_people)
    @people = all_people
    File.write('./people.json', @people)
  end

  def rentals_set(all_rentals)
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
    @books_file = File.open('./books.json', 'w') unless exist
    @books_file = File.open('./books.json')
    @books = @books_file.read
  end

  def fetch_people
    exist = File.exist?('./people.json')
    @people_file = File.open('./people.json', 'w') unless exist
    @people_file = File.open('./people.json')
    @people = @people_file.read
  end

  def fetch_rentals
    exist = File.exist?('./rentals.json')
    @rentals_file = File.open('./rentals.json', 'w') unless exist
    @rentals_file = File.open('./rentals.json')
    @rentals = @rentals_file.read
  end
end
