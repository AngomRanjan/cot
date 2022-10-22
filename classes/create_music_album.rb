def create_music_album
  print "Add Music Album\n\nEnter the album date of publish [yyyy-mm-dd]: "
  date_published = gets.chomp
  puts 'Is the album on spotify? [Y/N]: '
  ans = gets.chomp.downcase
  on_spotify = input_to_boolean(ans)
  puts 'Enter genre of Music album: '
  genre_name = gets.chomp
  @music_album = MusicAlbum.new(date_published, false, on_spotify: on_spotify)
  @music_album.add_genre(Genre.new(genre_name))
  add_genre(@genres, Genre.new(genre_name))
  puts 'Music album Added! Success'
  @music_album
end

def add_music_album(music_albums, record)
  music_albums << record
end

def input_to_boolean(input)
  case input
  when 'y'
    true
  when 'n'
    false
  else
    puts 'invalid response'
    print 'is album on spotify? [Y/N]: '
    input_to_boolean(gets.chomp)
  end
end

def add_genre(genres, genre)
  return if @genre_names.include?(genre.name)

  genres << genre
  @genre_names << genre.name
end
