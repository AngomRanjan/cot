class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
    @id = Random.rand(1..5000)
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  # Serialize Genre object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [name]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Genre object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
