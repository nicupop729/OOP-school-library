require './create_book'

describe Book do
  context 'when testing Book' do
    it 'creates a new instance of Book' do
      book1 = Book.new('Wild Russia', 'Maximilianovici')
      expect(book1.title).to eq 'Wild Russia'
    end

    it 'not to be rented' do
      book1 = Book.new('Wild Russia', 'Maximilianovici')
      expect(book1.rentals.length).to be 0
    end
  end
end
