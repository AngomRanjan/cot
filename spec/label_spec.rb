require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'test the attributes and the method in the Label class' do
    label = Label.new('Hope', 'red')
    it 'should return the correct title' do
      expect(label.title).to eq('Hope')
    end

    it 'should return the correct publisher' do
      expect(label.color).to eq('red')
    end

    it "should add an item to the label's items array" do
      book = Book.new('Hope', 'penguin', 'good', '1980')
      label.add_item(book)
      expect(label.items).to include(book)
    end
  end
end
