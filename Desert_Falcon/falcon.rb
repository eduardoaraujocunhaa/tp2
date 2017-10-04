require_relative 'gameObject'
require_relative 'box'
require_relative 'sprite'

class Falcon < GameObject
    attr_accessor :box

    def initialize
      @x = 320
      @y = 240
      @z = 1
      @image = Sprite.new("../Sprites/falcon.png")
      @box = Box.new(@x, @y, @image.image.width, @image.image.height)
      super(@image, @box, @z)
    end

    def update(dir)
      super
      case dir
        when 'l'
            @box.top -= 10
            @box.left -= 10
            @box.bottom -= 10
            @box.right -= 10
        when 'r'
            @box.top += 10
            @box.left += 10
            @box.bottom += 10
            @box.right += 10
        when 'u'
            "You passed a string"
        when 'd'
            "You passed a string"
    end
    end

    def notifyCollision(obj)
    end
end
