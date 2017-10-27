require_relative 'gameObject'
require_relative 'box'
require_relative 'sprite'

class Hiero < GameObject
  attr_accessor :box

  def initialize
    @x = rand(350..590)
    @y = rand(0..10)
    @z = 1
    @image = Sprite.new('../Sprites/hiero.png')
    @box = Box.new(@x, @y, @image.image.width, @image.image.height)
    super(@image, @box, @z)
  end

  def destroy
    super
  end

  def isDead
    @box.top > 480 && @box.right < 0
  end

  def update
    @box.top += 1
    @box.left -= 1
    @box.bottom += 1
    @box.right -= 1
  end

  def notifyCollision(obj); end
end
