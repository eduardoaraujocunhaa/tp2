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
    @font = Gosu::Font.new(30)
    @hieros = []
    @timer = 0
    @score = 0      
  end

  def update
    @timer += 1

    @falcon.update('l') if (Gosu.button_down? Gosu::KbLeft) && @falcon.box.left - 40 > 0 && @falcon.box.top - 40 > 0
    @falcon.update('r') if (Gosu.button_down? Gosu::KbRight) && @falcon.box.right + 40 < self.width && @falcon.box.bottom + 40 < self.height

    if @timer > 200
      @hieros << Hiero.new
      @timer = 0
    end

    if @hieros
      @hieros.each do |h|
        if h.box.overlapsWith(@falcon.box) and @falcon.z < 2
          @score += 1
          h.destroy
          @hieros.delete(h)
        else
          h.update
          if h.isDead
            @hieros.delete(h)
          end
        end
      end
    end

  end

  def draw
    @falcon.render
    @background_image.render(0, 0, 0)
    @hieros.each do |h|
      h.render
    end
    @font.draw("ALTURA: #{@falcon.z} SCORE: #{@score}", 0, (self.height - 25), 4, 1, 1, 0xff_ffffff)
  end

  def button_down(id)
    @falcon.update('u') if (Gosu.button_down? Gosu::KbUp) && @falcon.z < 3
    @falcon.update('d') if (Gosu.button_down? Gosu::KbDown) && @falcon.z > 1
    $window.close if id == Gosu::KbEscape
  end
end
