module Crud
  def add_book
    CreateBook.new.create_book(@books, @labels)
    back_mm
  end

  def show_books
    @list_items.show_books_list(@books)
    back_mm
  end

  def show_labels
    @list_items.show_labels_list(@labels)
    back_mm
  end

  def show_album
    list_music_albums
    back_mm
  end

  def show_genres
    list_genres
    back_mm
  end

  def add_album
    add_music_album(@music_albums, create_music_album)
    back_mm
  end

  def show_games
    ListGames.new.list_games(@games)
    back_mm
  end

  def show_authors
    ListAuthor.new.list_authors(@authors)
    back_mm
  end

  def add_games
    create_game(@games)
    back_mm
  end
end
