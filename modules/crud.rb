# rubocop:disable Lint/Syntax
module CrudItem
  def validate(str, inv_msg, msg = "\nPlease Enter #{str}: ", item_data = nil, isvalid: false)
    until isvalid
      print msg
      item_data = yield item_data
      msg = "\nInvalid #{str}! #{inv_msg} Please Enter Again: " unless (isvalid = !item_data.nil?)
    end
    item_data
  end

  def add_book(state: true)    
    while state
      system('clear')
      print "\nAdd a book\n"
      title = validate('title', 'Title cannot be empty') { |n| n if (n = gets.chomp).length.positive? }
      publisher = validate('author', 'Author cannot be empty') { |n| n if (n = gets.chomp).length.positive? }
      msg = ['Enter good or bad', 'Please Enter the Cover State [Good or Bad]: ']
      cover_state = validate('Cover State', msg[0], msg[1]) { |n| n if ['good', 'bad'].include?(n = gets.chomp.downcase) }
      publish_date = validate('the Publish Year', '') { |n| n if (n = gets.chomp.to_i).positive? }
      label_title = validate('Label Title', 'Label Title cannot be empty') { |n| n if (n = gets.chomp).length.positive? }
      label_color = validate('Label Color', 'Label Color cannot be empty') { |n| n if (n = gets.chomp).length.positive? }
      @books << Book.new(title, publisher, cover_state, publish_date)
      @labels << Label.new(label_title, label_color)
      print "\n\nTitle: #{title} Author: #{publisher}\nNew Book is Added successfully!\n"
      state = back_mm("Press [Y/y] to add another book\nOr") { %w[Y y].include?($stdin.getch) }
    end
  end

  def list_item(item, &)
    unless item.empty?
      item.each(&)
      return true
    end
    print "\nNo Record Found! Please try entering some!\n"
    false
  end
  # rubocop:enable Lint/Syntax

  def show_books
    print "\n====== List of Books available =======\n\n"
    list_item(@books) { |book| puts "Title: '#{book.title}', Publisher: #{book.publisher}, Published Date: #{book.publisher}, Cover State: #{book.cover_state}" }
    back_mm
  end

  def show_labels
    print "\n====== List of Labels available =======\n\n"
    list_item(@labels) { |lbl| puts "Title: '#{lbl.title}', Color: #{lbl.color}" }
    back_mm
  end
end