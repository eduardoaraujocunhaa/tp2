require 'gosu'
require_relative 'sprite'
require_relative 'falcon'
require_relative 'hiero'


class GameWindow < Gosu::Window

  def initialize(width=640, height=480, fullscreen=false)
    super
    self.caption = 'Desert Falcon'
    @background_image = Sprite.new("../Sprites/background.png")
    @falcon = Falcon.new
    @hiero = Hiero.new
  end

  def update
  end

  def draw
    @falcon.render
    @background_image.render(0, 0, 0)
    @falcon.render
    @hiero.render
  end

  def button_down(id)
    @falcon.update('l') if (id == Gosu::KbLeft) && @falcon.box.left - 70 > 0 && @falcon.box.top - 70 > 0
    @falcon.update('r') if (id == Gosu::KbRight) && @falcon.box.right + 70 < self.width && @falcon.box.bottom + 70 < self.height
    # @falcon.update('u') if (Gosu.button_down? Gosu::KbUp) && z_next_up > 0
    # @falcon.update('d') if (Gosu.button_down? Gosu::KbDown) && z_next_down < self.height
    $window.close if id == Gosu::KbEscape
  end
end
