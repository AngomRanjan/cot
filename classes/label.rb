require_relative 'item'
require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = SecureRandom.uuid)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
