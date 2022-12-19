class Person
    attr_reader :id
    attr_accessor :name , :age

    def initialize(age, name = 'unkown',parent_permission: true)
        @id = Random.rand(1..99999)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def is_of_age?
        @age >= 18
    end

    private :is_of_age?

    def can_use_services?
        is_of_age? || @parent_permission ? true : false
    end
end