require_relative '../rental/rental'
require_relative '../person/student'
require_relative '../book/book'


describe Book do
  before :each do
    @book = Book.new('The Power of now', 'Eckhart Tolle')
  end
  context '#Object Instatiation' do
    it 'It should instantiate an object' do
      expect(@book).to be_instance_of(Book)
    end

    it 'It Should Instatiate an object with given properties' do
      expect(@book.title).to eql('The Power of now')
      expect(@book.author).to eql('Eckhart Tolle')
    end

    it 'It Should make a rental' do
      @student = Student.new('12', 18, 'Selam')
      expect(@book.rentals.length).to eql(0)
      @book.add_rental('2023-01-04', @student)
      expect(@book.rentals.length).to eql(1)
    end
  end
end
