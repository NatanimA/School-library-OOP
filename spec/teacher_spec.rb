require_relative '../person/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Java Programming', 28, 'Phil John')
  end
  context '#given arguments' do
    it 'It should instantiate an object ' do
      expect(@teacher).to be_instance_of(Teacher)
    end
  end
  context '#when can_use_service? method is called' do
    it 'return true or false' do
      expect(@teacher.can_use_services?).not_to be false
    end
  end
  context '#to json' do
    it 'It should match Json format' do
      @json = @teacher.to_json(@teacher)
      expect(@json).to eql({ 'age' => 28, 'id' => @teacher.id, 'json_class' => 'Teacher', 'name' => 'Phil John',
                             'parent_permission' => true, 'specialization' => 'Java Programming' })
    end
  end
end
