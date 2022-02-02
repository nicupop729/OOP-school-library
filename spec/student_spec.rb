require './student'

describe Student do
  context 'when testing person' do
    it 'creates a new instance of Student' do
    maximilian = Student.new(25, '12f', 'Maximilian')    
    expect(maximilian.name).to eq 'Maximilian'
    end

    it 'plays hooky' do
    sarah = Student.new(32, 'Sarah')
    expect(sarah.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
