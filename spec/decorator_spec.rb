require_relative '../decorators'
require_relative '../person/student'

describe Nameable do
  before :each do
    person = Student.new('12', 17, 'elroi abesha')
    @name = BaseDecorator.new(person)
    @capitalized = CapitalizeDecorator.new(@name)
    @trimmed = TrimmerDecorator.new(@name)
  end

  context '#Given parameters' do
    it 'It should instantiate objects' do
      expect(@name).to be_instance_of(BaseDecorator)
      expect(@capitalized).to be_instance_of(CapitalizeDecorator)
    end

    it 'It should return the name' do
      expect(@name.correct_name).to eql('elroi abesha')
    end

    it 'It should capitalise the name' do
      expect(@capitalized.correct_name).to eql('Elroi abesha')
    end

    it 'It should trim the name' do
      expect(@trimmed.correct_name).to eql('elroi abes')
    end
  end
end
