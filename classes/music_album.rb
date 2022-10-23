require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date, archived: false)
    @on_spotify = on_spotify
  end

  # Serialize MusicAlbum object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [publish_date, on_spotify]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new MusicAlbum object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end

  private

  def can_be_archived?
    @on_spotify && Date.today.year - Date.parse(@publish_date).year > 10
  end
end
