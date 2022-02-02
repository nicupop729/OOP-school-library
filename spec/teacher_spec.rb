require './teacher'

describe Teacher do
  context 'when testing teacher' do
    it 'creates a new instance of Teacher' do
      adolf = Teacher.new('War', 55, 'Adolf')
      expect(adolf.name).to eq 'Adolf'
    end

    it 'can use services' do
      adolf = Teacher.new('War', 55, 'Adolf')
      expect(adolf.can_use_services?).to be true
    end
  end
end
