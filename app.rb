require_relative './modules/menu'
require_relative './modules/crud'
require_relative './classes/book'
require_relative './classes/label'

class App
  include Menu
  include CrudItem

  attr_accessor :books, :labels, :authors, :games
  attr_reader :music_albums, :genres

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def start
    menu
  end
end
