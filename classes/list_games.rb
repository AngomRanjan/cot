class ListGames
  def list_games(games)
    if games.empty?
      puts 'No Games to be displayed'
    else
      puts "#{games.count} Games Found!"
      games.each do |game|
        puts "Players: #{game.multiplayer}" \
             "-Last Played: #{game.last_played_at} - Published: #{game.publish_date}"
      end
    end
  end
end
