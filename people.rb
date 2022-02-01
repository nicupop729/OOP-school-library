require './teacher'
require './student'
require './classroom'

class People
  attr_accessor :people

  def initialize
    @people = []
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    input = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case input
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    end
    puts 'Person Created successfully'
    puts
  end

  def create_student(age, name)
    print 'Has parent permission?[Y/N] '
    parent_permission = gets.chomp
    print 'Classroom: '
    class_room = Classroom.new(gets.chomp)
    new_student = Student.new(age, class_room, name, parent_permission: parent_permission == 'y')
    @people << new_student
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(specialization, age, name)
    @people << new_teacher
  end
end
