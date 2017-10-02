require 'gosu'
require_relative 'sprite'
require_relative 'falcon'


class GameWindow < Gosu::Window
  
  def initialize(width=640, height=480, fullscreen=false)
    super
    self.caption = 'Desert Falcon'
    @background_image = Sprite.new("../Sprites/background.png")
    @falcon = Falcon.new    
  end

  def update

  end

  def draw
    @background_image.render(0, 0, 0)
    @falcon.render
  end

  def button_down(id)
    $window.close if id == Gosu::KbEscape
  end
end