require 'date'
require_relative '../classes/author'
require_relative '../classes/games'

describe Author do
  author = Author.new('Ang', 'Ran')
  Game.new('22', '2022-06-01', '1960-05-12')
  context '... this class...' do
    it 'should initialize with first_name and last_name' do
      expect(author.first_name).not_to be_nil
      expect(author.first_name).to be_a(String)
      expect(author.last_name).to eq 'Ran'
    end

    it 'should test weather author object is instance of Author class' do
      expect(author).to be_a Author
    end
  end
end
