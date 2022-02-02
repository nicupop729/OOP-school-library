require './teacher'
require './student'
require './classroom'
require './store_data'

class People
  attr_accessor :people

  def initialize
    @data = StoreData.new
    @data.fetch_data
    @people = JSON.parse(@data.people)
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
    @people << ({ "age": new_student.age, "class_room": class_room.label, "name": new_student.name, "parent_permission": new_student.parent_permission, "id": new_student.id})
    @data.set_people(JSON.generate(@people))
    @people = JSON.parse(@data.people)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(specialization, age, name)
    @people << ({"specialization": new_teacher.specialization, "age": new_teacher.age, name:new_teacher.name, "id": new_teacher.id})
    @data.set_people(JSON.generate(@people))
    @people = JSON.parse(@data.people)
  end
end
