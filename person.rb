require './decorators'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unkown', parent_permission: true)
    super()
    @id = Random.rand(1..99_999)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end
end
# #Check Using this code
# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# puts capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# puts capitalizedTrimmedPerson.correct_name
