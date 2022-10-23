require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  # Serialize Games object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [multiplayer, last_played_at, publish_date]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Games object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end

  private

  def can_be_archived?
    Date.parse(@last_played_at).next_year(2) > Date.today && super
  end
end
