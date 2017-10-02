require 'gosu'
require_relative 'sprite'


class GameWindow < Gosu::Window
  
  def initialize(width=640, height=480, fullscreen=false)
    super
    self.caption = 'Desert Falcon'
    @background_image = Sprite.new("../Sprites/background.png")
  end

  def update

  end

  def draw
    @background_image.render(0, 0, 0)
  end

  def button_down(id)
    $window.close if id == Gosu::KbEscape
  end
end