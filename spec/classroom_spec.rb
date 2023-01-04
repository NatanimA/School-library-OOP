require_relative '../classroom'
require_relative '../person/student'

describe Classroom do
  before :each do
    @class = Classroom.new('12')
  end

  context 'given #classroom' do
    it 'It instantiate object' do
      expect(@class).to be_instance_of(Classroom)
    end

    it ' It should have label property' do
      expect(@class.label).to eql('12')
    end

    it 'It should add students' do
      expect(@class.students.length).to eql(0)
      @student = Student.new('12', 7, 'Kiya')
      @class.add_student(@student)
      expect(@class.students.length).to eql(1)
    end
  end
end
