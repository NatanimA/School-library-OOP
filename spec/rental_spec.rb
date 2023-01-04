require_relative '../rental/rental'

describe Rental do
  before :each do
    @rental = Rental.new('2023-01-04', 'Gone with the wind', 'Kiya')
  end
  context 'context given three arguments' do
    it 'It should instantiate an object ' do
      expect(@rental).to be_instance_of(Rental)
    end

    it 'It should instatiate object with two properties' do
      expect(@rental.date).to eql('2023-01-04')
      expect(@rental.book).to eql('Gone with the wind')
      expect(@rental.person).to eql('Kiya')
    end
  end
end
