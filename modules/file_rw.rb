module FileRW
  def write_file(file_name, source_file)
    json_format = JSON.generate(source_file)
    File.write("./data/#{file_name}.json", json_format)
  end

  def read_file(file_name)
    return [] unless File.exist?("./data/#{file_name}.json")

    JSON.parse(File.read("./data/#{file_name}.json"), create_additions: true)
  end

  def load_data
    @books = read_file('books')
    @labels = read_file('labels')
    @music_albums = read_file('music_albums')
    @genres = read_file('genres')
    @games = read_file('games')
    @authors = read_file('authors')
  end

  def save_data
    write_file('books', @books)
    write_file('labels', @labels)
    write_file('music_albums', @music_albums)
    write_file('genres', @genres)
    write_file('games', @games)
    write_file('authors', @authors)
  end
end
