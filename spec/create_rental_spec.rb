require './create_rental'

describe Rental do
  context 'when testing Rental' do
    it 'creates a new instance of Rental' do
    rental1 = Rental.new('12.01.2022', 'Wild Russia', 'Maximilianovici', 623)    
    expect(rental1.book).to eq 'Wild Russia'
    expect(rental1.person).to eq 'Maximilianovici'
    end
  end
end