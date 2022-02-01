class StoreData
  attr_reader :books, :people, :rentals

  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def fetchData
    fetchBooks
    fetchPeople
    fetchRentals
  end

  def books(all_books)
    @books = all_books
    File.write('./books.json', @books)
  end

  def people(all_people)
    @people = all_people
    File.write('./people.json', @people)
  end

  def rentals(all_rentals)
    @rentals = all_rentals
    File.write('./rentals.json', @rentals)
  end

  def closeDocument
    @books_file.close
    @people_file.close
    @rentals_file.close
  end

  private

  def fetchBooks
    exist = File.exist?('./books.json')
    if (exist == false) 
      @books_file = File.open('./books.json', 'w')
    end
    @books_file = File.open('./books.json')
    @books = @books_file.read
    puts @books
  end

  def fetchPeople
    exist = File.exist?('./people.json')
    if (exist == false) 
      @people_file = File.open('./people.json', 'w')
    end
    @people_file = File.open('./people.json')
    @people = @people_file.read
    puts @people
  end

  def fetchRentals
    exist = File.exist?('./rentals.json')
    if (exist == false) 
      @rentals_file = File.open('./rentals.json', 'w')
    end
    @rentals_file = File.open('./rentals.json')
    @rentals = @rentals_file.read
    puts @rentals
  end

end

books_stored = StoreData.new()
puts books_stored.fetchData
