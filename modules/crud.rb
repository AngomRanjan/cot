module CrudItem
  def validate(str, inv_msg, msg = "\nPlease Enter #{str}: ", item_data = nil, isvalid: false)
    until isvalid
      print msg
      item_data = yield item_data
      msg = "\nInvalid #{str}! #{inv_msg} Please Enter Again: " unless (isvalid = !item_data.nil?)
    end
    item_data
  end

  def create_book
    title = validate('title', 'Title cannot be empty') { |n| n if (n = gets.chomp).length.positive? }
    publisher = validate('Publisher', 'Publisher cannot be empty') { |n| n if (n = gets.chomp).length.positive? }
    msg = ['Cover State', 'Enter good or bad!', 'Please Enter the Cover State [Good or Bad]: ']
    cover_state = validate(msg[0], msg[1], msg[2]) { |n| n if %w[good bad].include?(n = gets.chomp.downcase) }
    publish_date = validate('the Publish Year', '') { |n| n if (n = gets.chomp.to_i).positive? }
    Book.new(title, publisher, cover_state, publish_date)
  end

  def create_label
    label_title = validate('Label Title', 'Title cannot be empty!') { |n| n if (n = gets.chomp).length.positive? }
    label_color = validate('Label Color', 'Color cannot be empty!') { |n| n if (n = gets.chomp).length.positive? }
    Label.new(label_title, label_color)
  end

  def add_book(state: true)
    while state
      system('clear')
      print "\nAdd a book\n"
      new_book = create_book
      new_label = create_label
      @books << new_book
      @labels << new_label
      print "\n\nTitle: #{new_book.title} Author: #{new_book.publisher}\nNew Book is Added successfully!\n"
      state = back_mm("Press [Y/y] to add another book\nOr") { %w[Y y].include?($stdin.getch) }
    end
  end

  def add_album(state: true)
    while state
      system('clear')
      print "\nAdd New Music Album\n"
      msg = ['Date of publish', 'Invalid input!', 'Please Enter the date of publish [yyyy-mm-dd]: ']
      date_published = validate(msg[0], msg[1], msg[2]) { |n| n if (n = gets.chomp).length.positive? }
      msg = ['On spotify', 'Invalid input!', 'Is The album on Spotify [Y/N]: ']
      on_spotify = validate(msg[0], msg[1], msg[2]) { |n| n if %w[y n].include?(n = gets.chomp.downcase) }
      genre = validate('Genre', 'Genre cannot be empty!') { |n| n if (n = gets.chomp).length.positive? }
      @music_albums << MusicAlbum.new(date_published, on_spotify: on_spotify == 'y')
      @genres << Genre.new(genre)
      print "\n\nNew Music Album is Added successfully!\n"
      state = back_mm("Press [Y/y] to add another book\nOr") { %w[Y y].include?($stdin.getch) }
    end
  end

  def create_author
    msg_name = ["Author's first name", 'first name cannot be empty', "Author's last name", 'last name cannot be empty']
    first_name = validate(msg_name[0], msg_name[1]) { |n| n if (n = gets.chomp).length.positive? }
    last_name = validate(msg_name[2], msg_name[3]) { |n| n if (n = gets.chomp).length.positive? }
    Author.new(first_name, last_name)
  end

  def create_games
    msg = ['number of players', 'Should be a positive integer']
    multiplayer = validate(msg[0], msg[1]) { |n| n if (n = gets.chomp.to_i).positive? }
    msg = ['Last Played', 'Enter a Valid Date!', 'Please Enter Last Played on date [yyyy-mm-dd]: ']
    last_played_at = validate(msg[0], msg[1], msg[2]) { |n| n if (n = gets.chomp).length.positive? }
    msg = ['publish date', 'Enter a Valid Date!', 'Please Enter date of publish [yyyy-mm-dd]: ']
    publish_date = validate(msg[0], msg[1], msg[2]) { |n| n if (n = gets.chomp).length.positive? }
    Game.new(multiplayer, last_played_at, publish_date)
  end

  def add_games(state: true)
    while state
      system('clear')
      print "\nAdd New Game\n"
      game = create_games
      author = create_author
      @games << game
      @authors << author
      print "\n\nNew Game is Added successfully!\n"
      state = back_mm("Press [Y/y] to add another book\nOr") { %w[Y y].include?($stdin.getch) }
    end
  end
end
