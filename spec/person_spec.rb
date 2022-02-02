require './person'
require './corrector'

describe Person do
  context 'when testing person' do
    it 'creates a new instance of Person' do
      mathew = Person.new(25, 'Mathew')
      expect(mathew.name).to eq 'Mathew'
    end

    it 'capitalize the name' do
      sophie = Person.new(12, 'sophie')
      sophie.validate_name
      expect(sophie.name).to eq 'Sophie'
    end

    it 'shorten the name' do
      adam = Person.new(34, 'Adamachethedem')
      adam.validate_name
      expect(adam.name.length).to eq 10
    end
  end
end
