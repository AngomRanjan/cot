require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name, id = SecureRandom.uuid)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  # Serialize Author object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [first_name, last_name, id]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Author object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
