require './teacher'
require './student'
require './classroom'
require './book'
require './rental'

class Main
  def initialize
    @people = []
    @books = []
    @rentals = []
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

  def list_books_or_people(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    end
  end

  def list_books
    @books.each_with_index { |book, i| puts "#{i + 1}: Title: #{book.title}, Author: #{book.author}" }
    puts
  end

  def list_people
    @people.each_with_index { |person, i| puts "#{i + 1}: Name: #{person.name}, Age: #{person.age} ID: #{person.id}" }
    puts
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

  def create_rental
    puts 'Select the index of desired book from the following list:'
    @books.each_with_index { |book, i| puts "#{i + 1}: Title: #{book.title}, Author: #{book.author}" }
    book_idx = gets.chomp.to_i
    puts 'Select the index of the person from the following list:'
    @people.each_with_index do |person, i|
      puts "#{i + 1}: Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    person_idx = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_idx - 1], @people[person_idx - 1])
    @rentals << rental
    puts 'Rental created successfully'
    puts
  end

  def list_rentals_for_person
    puts 'Display people: '
    list_people
    print 'ID of person: '
    id_of_person = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title}, renter #{rent.book.author}" if rent.person.id == id_of_person
    end
    puts
  end

  def select_option
    loop do
      print_options
      input = gets.chomp
      case input
      when '1', '2'
        list_books_or_people(input)
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        list_rentals_for_person
      when '7'
        break
      end
    end
  end
end

test = Main.new
test.select_option
