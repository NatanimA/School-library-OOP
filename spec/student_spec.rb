require_relative '../person/student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new('11', 16, 'Suad')
  end

  context '#Given arguments' do
    it 'It should instantiate object' do
      expect(@student).to be_instance_of(Student)
    end

    it 'has properties' do
      expect(@student.name).to eql('Suad')
      expect(@student.classroom).to eql('11')
      expect(@student.age).to eql(16)
    end
  end

  context ' when add_classroom method is called' do
    it 'It should add student to class' do
      @stu_one = Classroom.new('11')
      @student.classroom = @stu_one
      expect(@student.classroom.students.length).to eql(1)
    end
  end
end
