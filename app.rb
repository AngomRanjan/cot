require_relative './modules/menu'
require_relative './modules/crud'

require_relative './classes/list_items'
require_relative './classes/create_book'
require_relative './modules/save_books'
require_relative './modules/load_books'
require_relative './classes/label'

require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './classes/create_music_album'
require_relative './classes/list_music_data'
require_relative './modules/save_music_album'
require_relative './modules/load_music_album'

require_relative './modules/load_author'
require_relative './modules/load_game'
require_relative './classes/list_games'
require_relative './classes/list_author'
require_relative './modules/save_games'
require_relative './classes/author'

require 'json'

class App
  include Menu
  include Crud
  include SaveBookData
  include LoadBookData
  include LoadMusicData
  include SaveMusicData
  include GameModule
  include SaveGameData
  include AuthorModule

  attr_accessor :books, :labels, :authors, :games
  attr_reader :music_albums, :genres

  def initialize
    @books = load_books
    @labels = load_labels
    @list_items = ListItems.new
    @music_albums = load_music_albums
    @genre_names = load_genres_names
    @genres = load_music_genres
    @games = fetch_games
    @authors = fetch_authors
  end

  def start
    menu
  end
end
