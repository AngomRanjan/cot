require_relative './modules/menu'
require_relative './modules/crud'
require_relative './modules/file_rw'
require_relative './modules/display_item'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './classes/games'
require_relative './classes/author'
require 'json'

class App
  include Menu
  include CrudItem
  include FileRW
  include DisplayItem

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
    load_data
    menu
  end

  def exit_app
    save_data
    system('clear')
    print "\n\n\n\t\t\t", '|| ', '=' * 8, ' Thanks You! ', '=' * 8, ' ||', "\n\n\n"
    exit
  end
end
