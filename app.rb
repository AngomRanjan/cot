require_relative './modules/menu'

class App
  include Menu

  def start
    menu
  end
end
