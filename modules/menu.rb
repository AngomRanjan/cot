require 'io/console'

module Menu
  def main_items
    {
      1 => { name: 'Books', fun: :books_menu, sub_menu: { 1 => :show_books, 2 => :show_labels, 3 => :add_book } },
      2 => { name: 'Music Album', fun: :album_menu,
             sub_menu: { 1 => :show_album, 2 => :show_genres, 3 => :add_album } },
      3 => { name: 'Games', fun: :games_menu, sub_menu: { 1 => :show_games, 2 => :show_authors, 3 => :add_games } },
      4 => { name: 'Exit', fun: :exit }
    }
  end

  def sub_menu_items
    {
      1 => ['List of Books', 'List of Labels', 'Add New Book'],
      2 => ['List of Music Albums', 'List of Genres', 'Add New Music Album'],
      3 => ['List of Games', 'List of authors', 'Add New Game']
    }
  end

  def back_mm(msg = '')
    print "\n\n", msg, "\nPress any key to return to main menu...."
    return yield if block_given?

    $stdin.getch
  end

  def main_menu
    system('clear')
    menu_ui = "\n|****** Welcome to Catalog App! ******|\n\n"
    main_items.each { |k, v| menu_ui += "#{k} - #{v[:name]}\n" }
    menu_ui += "\n"
    menu_ui
  end

  def sub_menu(item, err_msg = '', sel = 0, state: false)
    until state
      system('clear')
      printf "%s Sub-Menu\n\n", main_items[item][:name]
      sub_menu_items[item].each_with_index { |x, i| printf "%<a>5d.  %<b>-16s\n", a: i + 1, b: x }
      printf "\n%<a>s\nPlease enter your choice[%<b>d - %<c>d]: ", a: err_msg, b: 1, c: sub_menu_items[item].length
      state = (1..3).include?(sel = gets.chomp.to_i)
      err_msg = 'Invalid Choice!'
    end
    app_run(main_items[item][:sub_menu][sel])
  end

  def app_run(func)
    system('clear')
    method(func).call
    ''
  end

  def menu(msg = '', state: true)
    while state
      printf "%<a>s%<b>s\nEnter your choice (1 - 4): ", a: main_menu, b: msg
      state = (s = gets.chomp.to_i) != 4
      msg = (1..3).include?(s) ? sub_menu(s) : 'Invalid Choice!'
    end
    exit_app
  end
end
