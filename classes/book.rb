require_relative 'item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state
# rubocop:disable Lint/Syntax
  def initialize(title, publisher, cover_state, publish_date)
    super(publish_date, archived:)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end
# rubocop:disable Lint/Syntax

  # Serialize book object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, publisher, cover_state, publish_date]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
