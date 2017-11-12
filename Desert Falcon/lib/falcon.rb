require_relative 'gameObject'
require_relative 'box'
require_relative 'sprite'

class Falcon < GameObject
  attr_accessor :box, :z

  def initialize
    @x = 320
    @y = 250
    @z = 2
    @image = Sprite.new('../Sprites/falcon.png')
    @shadow = Sprite.new('../Sprites/falcon_shadow.png')
    @box = Box.new(@x, @y, @image.image.width, @image.image.height)
    super(@image, @shadow, @box, @z)
  end

  def update(dir)
    case dir
    when 'l'
      @box.top -= 2
      @box.left -= 2
      @box.bottom -= 2
      @box.right -= 2
    when 'r'
      @box.top += 2
      @box.left += 2
      @box.bottom += 2
      @box.right += 2
    when 'u'
      @z += 1
    when 'd'
      @z -= 1
    end
  end

  def notifyCollision(obj); end
end
