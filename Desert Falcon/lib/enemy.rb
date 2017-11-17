require_relative 'gameObject'
require_relative 'box'
require_relative 'sprite'

class Enemy < GameObject
  attr_accessor :box, :z

  def initialize
    @x = rand(0..840)
    @y = rand(-30..10)
    @z = rand(1..3)
    @image = Sprite.new('../Sprites/elephant_shadow.png')
    @shadow = Sprite.new('../Sprites/elephant.png')
    @box = Box.new(@x, @y, @image.image.width, @image.image.height)
    super(@image, @shadow, @box, @z)
  end

  def update()
    @box.top += 2
    @box.left -= 2
    @box.bottom += 2
    @box.right -= 2
  end

  def notifyCollision(obj); end
end
