require './teacher'
require './student'
require './classroom'
require './book'
require './rental'

class List
  attr_reader :list

  def initialize(list, type)
    @list = list
    @type = type
  end

  def list_items
    if @type == 'people'
      @list.each_with_index { |item, i| puts "#{i + 1}: Name: #{item.name}, Age: #{item.age} ID: #{item.id}" }
    else
      @list.each_with_index { |item, i| puts "#{i + 1}: Title: #{item.title}, Author: #{item.author}" }
    end
  end
end

class Books
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts 'New book created successfully'
    puts
  end
end

class People
  attr_accessor :people

  def initialize
    @people = []
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    input = gets.chomp
    case input
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission?[Y/N] '
    parent_permission = gets.chomp
    print 'Classroom: '
    class_room = Classroom.new(gets.chomp)
    new_student = Student.new(age, class_room, name, parent_permission: parent_permission == 'y')
    puts 'Person Created successfully'
    @people << new_student
    puts
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(specialization, age, name)
    puts 'Person created successfully'
    @people << new_teacher
    puts
  end
end

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
      puts "Date: #{rent.date}, Book: #{rent.book.title}, renter #{rent.book.author}" if rent.person.id == id_of_person
    end
    puts
  end
end

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
