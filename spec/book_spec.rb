require_relative '../classes/book'

describe Book do
  context 'test the methods in the Book class' do
    book = Book.new('My Title', 'Penguin', 'good', '1980')
    it 'should return the correct title' do
      expect(book.title).to eq('My Title')
    end

    it 'should return the correct publisher' do
      expect(book.publisher).to eq('Penguin')
    end

    it 'should return the correct cover state' do
      expect(book.cover_state).to eq('good')
    end

    it 'should return the correct publish date' do
      expect(book.publish_date).to eq('1980')
    end

    it 'test if can_be_archived? returns true' do
      expect(book.move_to_archive).to eq(true)
    end
  end
end
