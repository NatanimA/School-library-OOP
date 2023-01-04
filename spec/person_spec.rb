require_relative '../book/book'
require_relative '../person/person'
require_relative '../rental/rental'


describe Person do
  before :each do
    @person = Person.new(29, 'John Doe')
  end
  context '#Given properties' do
    it 'It should instantiate an object ' do
      expect(@person).to be_instance_of(Person)
    end

    it 'It should instatiate object with all person properties' do
      expect(@person.id)
      expect(@person.name).to eql('John Doe')
      expect(@person.age).to eql(29)
      expect(@person.parent_permission).to be true
    end
  end

  context 'when can_use_service? method is called' do
    it 'It should return true or false' do
      expect(@person.can_use_services?).not_to be false
    end
  end

  context 'when add rental method is callled' do
    it 'It should add the rental to the array' do
      expect(@person.rentals.length).to eql(0)
      @book = Book.new('Gone with the wind', 'Amanda')
      @person.add_rental('2002-07-09', @book)
      expect(@person.rentals.length).to eql(1)
    end
  end
end
