module DisplayItem
  def list_item(item, &block)
    unless item.empty?
      item.each(&block)
      return true
    end
    print "\nNo Record Found! Please try entering some!\n"
    false
  end

  def show_books
    print "\n====== List of Books available =======\n\n"
    list_item(@books) { |bk| puts "Title: #{bk.title}, Publisher: #{bk.publisher}, Year: #{bk.publish_date}" }
    back_mm
  end

  def show_labels
    print "\n====== List of Labels available =======\n\n"
    list_item(@labels) { |lbl| puts "Title: #{lbl.title}, Color: #{lbl.color}" }
    back_mm
  end

  def show_album
    print "\n====== List of Music Albums available =======\n\n"
    list_item(@music_albums) { |a| puts "Publish Date: #{a.publish_date}, On Spotify: #{a.on_spotify ? 'Yes' : 'No'}" }
    back_mm
  end

  def show_genres
    print "\n====== List of Genres available =======\n\n"
    list_item(@genres) { |genres| puts "\t\t#{genres.name}" }
    back_mm
  end

  def show_games
    print "\n====== List of Games available =======\n\n"
    ms = ['No. of player : ', 'Last played on: ', 'Publish date: ']
    list_item(@games) { |a| puts "#{ms[0]}#{a.multiplayer}, #{ms[1]}#{a.last_played_at}, #{ms[2]}#{a.publish_date}" }
    back_mm
  end

  def show_authors
    print "\n====== List of Authors available =======\n\n"
    list_item(@authors) { |a| puts "\t\t#{a.first_name.capitalize} #{a.last_name.capitalize}" }
    back_mm
  end
end
