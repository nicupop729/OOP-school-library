class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name
  attr_accessor :age
  attr_reader :id

  def can_use_services?
    true if is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    true if @age >= 18
   
  end

end
