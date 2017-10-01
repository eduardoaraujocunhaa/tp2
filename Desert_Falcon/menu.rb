require 'gosu'

class Menu < Gosu::Window
  
  def initialize(width=800, height=600, fullscreen=false)
    super
    self.caption = 'Desert Falcon'
    @message = Gosu::Image.from_text(
      self, 'Desert Falcon',
      Gosu.default_font_name, 100)
  end

  def update
    @info = Gosu::Image.from_text(
      self, "Q = Quit, N = New Game",
      Gosu.default_font_name, 30)
  end

  def draw
    @message.draw(
      $window.width / 2 - @message.width / 2,
      $window.height / 2 - @message.height / 2,
      10)
    @info.draw(
      $window.width / 2 - @info.width / 2,
      $window.height / 2 - @info.height / 2 + 200,
      10)
  end

  def button_down(id)
    $window.close if id == Gosu::KbQ
    if id == Gosu::KbN
      # @play_state = PlayState.new
      # GameState.switch(@play_state)
    end
  end
end

$window = Menu.new
# GameState.switch(MenuState.instance)
$window.show